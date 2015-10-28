#include <stdio.h>

int large(int x, int y) {
    if(x > y){
        return x;
    }else{
        return y;
    }
}

void main(){
    int a=9, b=4, c=8;
    
    if( large(a,b) == a){
        printf("max is %d\n", large(a,c));
    }else{
        printf("max is %d\n", large(b,c));
    }
}