#include <netinet/ip.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <mex.h>

#define BUFSIZE 177
#define PORT 9930
#define TIMEOUT 1
#define VLEN 10000

/* Globals */
int sockfd=-1;
struct sockaddr_in sa;
struct mmsghdr msgs[VLEN];
struct iovec iovecs[VLEN];
unsigned char bufs[VLEN][BUFSIZE+1];
struct timespec timeout;
/* Globals */

void diep(char *s)
{
    perror(s);
    exit(1);
}

void udpOpen()
{
    
    int i;
    
    if (sockfd>0) {
     printf("Socket already opened!\n");
     printf("sockfd: %d\n",sockfd);
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
    
    timeout.tv_sec = TIMEOUT;
    timeout.tv_nsec = 0;
    
    
}

void udpReceive(unsigned char *data )
{
    
    int retval=-1, i;
    
    /* Debug
    if (sockfd>0) {
        printf("Socket: %d\n",sockfd);
        printf("MSG Debug, should be 1: %d\n",msgs[5].msg_hdr.msg_iovlen);
        printf("Timeout Debug, should be 0: %d\n",timeout.tv_nsec);
         return; 
    } 
    */
    
    retval = recvmmsg(sockfd, msgs, VLEN, 0, NULL);
    if (retval == -1) {
        perror("recvmmsg()");
        exit(EXIT_FAILURE);
    }
    
    memcpy(data,bufs,(BUFSIZE+1)*VLEN);
    
    /*
     * for (i = 0; i < retval; i++) {
        bufs[i][msgs[i].msg_len] = 0; 
        memcpy(data,bufs,(BUFSIZE+1)*VLEN);  
        printf("bufs[%d][3]: %u\n",i,bufs[i][10]); 
        printf("msgs[%d].msg_len=%d\n",i,msgs[i].msg_len); 
    } 
     */ 


}


void udpClose()
{
    printf("Closing socket %d\n",sockfd);
    close(sockfd);
    sockfd=-1;
}

/*
 * #define _GNU_SOURCE
 * #include <netinet/ip.h>
 * #include <stdio.h>
 * #include <stdlib.h>
 * #include <string.h>
 * #include <sys/socket.h>
 *
 * int
 * main(void)
 * {
 * #define VLEN 10
 * #define BUFSIZE 200
 * #define TIMEOUT 1
 * int sockfd, retval, i;
 * struct sockaddr_in sa;
 * struct mmsghdr msgs[VLEN];
 * struct iovec iovecs[VLEN];
 * char bufs[VLEN][BUFSIZE+1];
 * struct timespec timeout;
 *
 * sockfd = socket(AF_INET, SOCK_DGRAM, 0);
 * if (sockfd == -1) {
 * perror("socket()");
 * exit(EXIT_FAILURE);
 * }
 *
 * sa.sin_family = AF_INET;
 * sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
 * sa.sin_port = htons(1234);
 * if (bind(sockfd, (struct sockaddr *) &sa, sizeof(sa)) == -1) {
 * perror("bind()");
 * exit(EXIT_FAILURE);
 * }
 *
 * memset(msgs, 0, sizeof(msgs));
 * for (i = 0; i < VLEN; i++) {
 * iovecs[i].iov_base         = bufs[i];
 * iovecs[i].iov_len          = BUFSIZE;
 * msgs[i].msg_hdr.msg_iov    = &iovecs[i];
 * msgs[i].msg_hdr.msg_iovlen = 1;
 * }
 *
 * timeout.tv_sec = TIMEOUT;
 * timeout.tv_nsec = 0;
 *
 * retval = recvmmsg(sockfd, msgs, VLEN, 0, &timeout);
 * if (retval == -1) {
 * perror("recvmmsg()");
 * exit(EXIT_FAILURE);
 * }
 *
 * printf("%d messages received\n", retval);
 * for (i = 0; i < retval; i++) {
 * bufs[i][msgs[i].msg_len] = 0;
 * printf("%d %s", i+1, bufs[i]);
 * }
 * exit(EXIT_SUCCESS);
 * }
 */

void mexFunction( int nlhs, mxArray *plhs[],
        int nrhs, const mxArray *prhs[])
{
    
    char fun[81];
    mwSize strlen=mxGetN(prhs[0])+1;
    mxGetString(prhs[0],fun,strlen);
    /* printf("%s\n",fun); */
    
    if (strcmp(fun,"Open")==0) { 
        mexLock();
        udpOpen();
    }
    
    if (strcmp(fun,"Receive")==0) {
        unsigned char* data;        
        plhs[0] = mxCreateNumericMatrix(1,(BUFSIZE+1)*VLEN, mxUINT8_CLASS, mxREAL);
        data = mxGetData(plhs[0]);       
        
        udpReceive(data);
    }
    
    if (strcmp(fun,"Close")==0) {
        udpClose();
        mexUnlock();
    }
}