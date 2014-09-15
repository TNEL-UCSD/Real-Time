#include <netinet/ip.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <mex.h>
#include <pthread.h>

#define BUFSIZE 178
#define PORT 9930
#define TIMEOUT 1
#define VLEN 1000
#define NUMBUFS 64

/* Globals */
int sockfd=-1;
struct sockaddr_in sa;
struct mmsghdr msgs[VLEN];
struct iovec iovecs[VLEN];
struct timespec timeout;
unsigned char bufs[VLEN][BUFSIZE+1];
unsigned char data[NUMBUFS+1][VLEN*(BUFSIZE+1)];

int buffWriteIdx=0, numBuffFilled=0;
pthread_t udpThread;
pthread_mutex_t packetDataMutex = PTHREAD_MUTEX_INITIALIZER;
/* Globals */

void diep(char *s)
{
    perror(s);
    exit(1);
}

void udpReceiverThread()
{
    
    int retval=-1, buffWriteIdxTmp=buffWriteIdx;
    
    pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);    
    
    while (1) {
        
        retval = recvmmsg(sockfd, msgs, VLEN, 0, NULL);
        if (retval == -1) {
            perror("recvmmsg()");
            udpClose();
            exit(EXIT_FAILURE);
        }
        
        if (numBuffFilled>=NUMBUFS) {
            printf("Not enough room in the buffer!\n");
            udpClose();
            exit(EXIT_FAILURE);
        }
        
        memcpy(data[buffWriteIdx],bufs,(BUFSIZE+1)*VLEN);
        
        if (buffWriteIdx+1>=NUMBUFS)
            buffWriteIdxTmp=0;
        else
            buffWriteIdxTmp=buffWriteIdxTmp+1;
        
        /* Packet Buffer Critical Section */
        pthread_mutex_lock(&packetDataMutex);
        buffWriteIdx = buffWriteIdxTmp;
        numBuffFilled = numBuffFilled+1;
        pthread_mutex_unlock(&packetDataMutex);
        /* END CRITICAL SECTION */
        
        pthread_testcancel();

    }
    
}

void udpOpen()
{
    
    int i, rc=-1;
    buffWriteIdx=0, numBuffFilled=0;
    
    if (sockfd>0) {
        printf("Socket already opened!\n");
        printf("sockfd: %d\n",sockfd);
        return;
    }
    
    if  (mexIsLocked()) {
        printf("mex is locked!\n");
        return;
    }
    
    
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd == -1) {
        perror("socket()");
        exit(EXIT_FAILURE);
    }
    
    int a = 10*1024*1024; /* Set socket buffer size to avoid dropped packets */
    if (setsockopt(sockfd, SOL_SOCKET, SO_RCVBUF, (char*)&a, sizeof(int)) == -1) {
        fprintf(stderr, "Error setting socket receive buffer size \n");
    }
    
    sa.sin_family = AF_INET;
    sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    sa.sin_port = htons(9930);
    if (bind(sockfd, (struct sockaddr *) &sa, sizeof(sa)) == -1) {
        perror("bind()");
        exit(EXIT_FAILURE);
    }
    
    memset(msgs, 0, sizeof(msgs));
    for (i = 0; i < VLEN; i++) {
        iovecs[i].iov_base         = bufs[i];
        iovecs[i].iov_len          = BUFSIZE;
        msgs[i].msg_hdr.msg_iov    = &iovecs[i];
        msgs[i].msg_hdr.msg_iovlen = 1;
    }
    
    /*
    timeout.tv_sec = TIMEOUT;
    timeout.tv_nsec = 0;
    */
     
    printf("Starting UDP Thread \n");
    rc = pthread_create(&udpThread, NULL, udpReceiverThread, NULL);
    if (rc) {
        printf("ERROR!  Return code from pthread_create() is %d\n", rc);
        exit(-1);
    }
    
    
}

void udpRead(unsigned char *dataOut)
{
    int stIdx, numBytes, stIdxA, numBuffA;    
       
    printf("Entered Read\n"); 
    
     /* Packet Buffer Critical Section */
    pthread_mutex_lock(&packetDataMutex);
   
    stIdx=buffWriteIdx-numBuffFilled;
    numBytes=numBuffFilled*VLEN*(BUFSIZE+1);     
    
    /* Takes into account wrap around */
    if (stIdx<0) {
        stIdxA=stIdx+NUMBUFS;
        numBuffA=-1*stIdx;
        memcpy(dataOut,data[stIdxA],numBuffA*VLEN*(BUFSIZE+1));
        memcpy(dataOut,data[0],(numBuffFilled-numBuffA)*VLEN*(BUFSIZE+1));
    }
    else        
        memcpy(dataOut,data[stIdx],numBytes);
    
    
    numBuffFilled = 0;
    pthread_mutex_unlock(&packetDataMutex);
    /* END CRITICAL SECTION */
    
}


void udpClose()
{
    printf("Closing socket %d\n",sockfd);
    printf("Ending UDP Thread\n");
    pthread_cancel(udpThread);
    pthread_join(udpThread, NULL);
    close(sockfd);
    sockfd=-1;
}


void mexFunction( int nlhs, mxArray *plhs[],
        int nrhs, const mxArray *prhs[])
{
    
    char fun[81];
    mwSize strlen=mxGetN(prhs[0])+1;
    mxGetString(prhs[0],fun,strlen);
    
    if (strcmp(fun,"Open")==0) {        
        udpOpen();
        mexLock();
    }
    
    if (strcmp(fun,"Read")==0) {
        unsigned char *dataOut;
        plhs[0] = mxCreateNumericMatrix((BUFSIZE+1)*VLEN, NUMBUFS, mxUINT8_CLASS, mxREAL);
        memset(plhs[0],1,sizeof(plhs[0]));
        dataOut = mxGetData(plhs[0]);
        
        udpRead(dataOut);
    }
    
    if (strcmp(fun,"Close")==0) {
        udpClose();
        mexUnlock();
    }
}