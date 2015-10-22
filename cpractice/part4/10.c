#include <stdio.h>

void main()
{
    int x,y;
    printf("x: "); scanf("%d", &x);
    printf("y: "); scanf("%d", &y);
    
    if( x < y && x%2 == 0 && y%2 == 0){
        printf("xはyより小さく、x,yはともに偶数である\n");
    }
    if( x == y && x < 0 && y < 0) {
        printf("xとyは等しく、かつ、負の数である\n");
    }
    if( x < y || x%2 == 0){
        printf("xはyより小さい、またはxは偶数である\n");
    }
    if( (x <= 10 || x >= 100) && y >=10 && y <= 100 ) {
        printf("xは10以下または100以上でかつ、yは10以上100以下である\n");
    }
    if(!(x < 0 && y < 0)){
        printf("xもyも負の数である、の否定");
    }
}