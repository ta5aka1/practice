#include <stdio.h>

int average(int x, int y) {
    return (int)(x + y) / 2;
}

void main(){
    int a = 8, b = 9;
    printf("real:%d ave:%d\n", (a+b)/2, average(a,b));
}