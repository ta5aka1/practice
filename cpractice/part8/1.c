#include <stdio.h>

void main(){
    int x;
    int* p;
    
    //xの値を12にする。
    p = &x;
    *p = 12;
    
    printf("%d\n", x);
}