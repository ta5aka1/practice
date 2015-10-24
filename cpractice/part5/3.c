#include <stdio.h>

void main()
{
    int i;
    int x = 1;
    for(i = 0; i < 8; i++) {
        x = x*2;
        printf("2^%d:%d\n", i+1, x);
    }
}