#include <stdio.h>

void main()
{
    int x = 3;
    // 1000より小さい3の累乗（3,6,9 ...)
    while(1) {
        if(x > 1000) {
            break;
        }
        printf("%d, ",x);
        x = x*3;
    }
}