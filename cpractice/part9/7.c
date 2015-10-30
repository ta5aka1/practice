#include <stdio.h>

char toUpper(char str){
    if(str >= 'a' && str <= 'z') {
        return str + ('A' - 'a');
    }
    return str;
}

void main(){
    char word[20] = "Hello World!";
    int i;
    for(i = 0; i<20; i++){
        if(word[i] == '\0') {
            printf("%c", toUpper(word[i]));
            break;
        }
        printf("%c", toUpper(word[i]));
    }
    printf("\n");
}