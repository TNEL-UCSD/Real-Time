#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <mex.h>

#define BUFLEN 177
#define NPACK 100
#define PORT 9930

void diep(char *s)
{
    perror(s);
    exit(1);
}

void udpServer(unsigned char* data)
{
    struct sockaddr_in si_me, si_other;
    int s, i, slen=sizeof(si_other);
    unsigned char buf[BUFLEN];
    
    if ((s=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP))==-1)
        diep("socket");
    
    memset((char *) &si_me, 0, sizeof(si_me));
    si_me.sin_family = AF_INET;
    si_me.sin_port = htons(PORT);
    si_me.sin_addr.s_addr = htonl(INADDR_ANY);
    if (bind(s, &si_me, sizeof(si_me))==-1)
        diep("bind");
    
    
    if (recvfrom(s, buf, BUFLEN, 0, &si_other, &slen)==-1)
        diep("recvfrom()");
    /*printf("Received packet from %s:%d\nData: %s\n\n",
     * inet_ntoa(si_other.sin_addr), ntohs(si_other.sin_port), buf);*/
    
    
    memcpy(data,buf,BUFLEN);
    close(s);
}

void mexFunction( int nlhs, mxArray *plhs[],
        int nrhs, const mxArray *prhs[])
{
    unsigned char* data;
    plhs[0] = mxCreateNumericMatrix(1,BUFLEN, mxUINT8_CLASS, mxREAL);
    data = mxGetData(plhs[0]); 
    udpServer(data);
}