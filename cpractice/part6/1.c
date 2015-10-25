#include <stdio.h>

void main(){
    int x[10];
    int i;
    
    for(i = 0; i<10; i++) {
        x[i] = i+1;
        printf("input: %d output:%d\n", x[i], x[i] *2);
    }
    printf("reverse array--------\n");
    for(i=9; i >= 0; i--){
        printf("%d ", x[i] *2);
    }
    printf("\n");
}