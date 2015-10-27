#include <stdio.h>

void main(){
    char str[] = "hello world";
    
    *str -= ('a' - 'A');
    *(str + 6) -= ('a' - 'A');

    printf("%s\n", str);
    
}