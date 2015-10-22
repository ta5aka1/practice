#include <stdio.h>
void main()
{
    int x,y;
    printf("x: "); scanf("%d", &x);
    printf("y: "); scanf("%d", &y);
    
    if(x > y){
        printf("x > y\n");
    }else if(x < y){
        printf("x < y\n");
    }
}