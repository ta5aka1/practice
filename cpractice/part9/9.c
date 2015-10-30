#include <stdio.h>

void swap(int *x, int *y){
    int tmp;
    tmp = *y;
    *y = *x;  
    *x = tmp;
}

void main(){
    int array[10] = { 9, 8, 7, 4, 5, 6, 3, 2, 1, 0};
    int i,j;
    for(i = 0; i < 10; i++){
        for(j = 9; j > i; j--){
            if( array[i] > array[j]){
                swap(&array[i], &array[j]);

            }
        }
        printf("%2d ", array[i]);
    }
    printf("\n");
}