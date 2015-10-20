#include <stdio.h>

void main()
{
    int x,y,z;
    x = 3;
    y = 7;
    
    z = x;
    x = y;
    y = z;
    
    printf("x=%d, y=%d\n", x, y);
}