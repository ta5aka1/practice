#include <stdio.h>

void main(){
    int x[10];
    int *p;
    int i;
    
    p = x;
    
    for(i = 0; i < 10; i++){
        printf("num[%d]:", i);
        scanf("%d", p);
        p++;
    }
    p--;
    printf("output-------------\n");
    for(i = 0; i < 10; i++) {
        printf("%d ", *p);
        p--;
    }
    printf("\n");
}