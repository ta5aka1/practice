#include <stdio.h>

struct POINT {
    int x;
    int y;
};

struct POINT doublePoint (struct POINT base){
    base.x = base.x*2;
    base.y = base.y*2;
    return base;
}
void main(){
    struct POINT a;
    a.x = 2;
    a.y = 3;
    a = doublePoint(a);
    
    printf("x:%d y:%d\n", a.x, a.y);
}