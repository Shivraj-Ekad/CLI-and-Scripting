#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>

void handle_sigterm(int sig) {
    printf("SIGTERM received from child process\n");
}

void handle_sigint(int sig) {
    printf("SIGINT received. Parent exiting safely\n");
    exit(0);
}

int main() {

    signal(SIGTERM, handle_sigterm);
    signal(SIGINT, handle_sigint);

    if(fork() == 0) {
        sleep(5);
        kill(getppid(), SIGTERM);
        exit(0);
    }

    if(fork() == 0) {
        sleep(10);
        kill(getppid(), SIGINT);
        exit(0);
    }

    while(1) {
        sleep(1);
    }

    return 0;
}
