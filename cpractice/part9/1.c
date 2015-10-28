#include <stdio.h>

int calc(int x) {
    return x*x;
}
void main(){
    int a = 2;
    printf("test: %d, calc:%d\n", a*a, calc(a));
}