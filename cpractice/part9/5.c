#include <stdio.h>

void printTriangle(int row, char str){
    int i,j;
    for(i = 1; i <= row; i++){
        for(j = 0; j<i; j++){
            printf("%c", str);
        }
        printf("\n");
    }
    printf("\n");
}
void main(){
    printTriangle(3, 'a');
    printTriangle(4, 'b');
    printTriangle(5, 'X');
}