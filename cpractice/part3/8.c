#include <stdio.h>
void main()
{
    int x = 10;
    int y = 0;
    int i;
    for(i=0; i<10; i++){
        printf("%d, %d\n", x--, y++);
    }
}