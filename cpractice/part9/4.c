#include <stdio.h>

void printTriangle(int row){
    int i,j;
    for(i = 1; i <= row; i++){
        for(j = 0; j<i; j++){
            printf("$");
        }
        printf("\n");
    }
    printf("\n");
}
void main(){
    printTriangle(3);
    printTriangle(4);
    printTriangle(5);
}