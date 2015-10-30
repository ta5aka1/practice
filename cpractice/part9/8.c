#include <stdio.h>

int isSosuu(int x){
    int counter;

    for(counter = 2; x > counter; counter++){
        if( x % counter == 0) {
            return 0;
        }
    }
    return 1;
}

void main() {
    int i;
    for (i = 2; i < 1000; i++){
        if(isSosuu(i) == 1){
            printf(" %d",i);
        }
    }
    printf("\n");
}