#include <stdio.h>

struct STUDENT {
    char name[30];
    int score;
    char result;
};

char judge(struct STUDENT *seito){
    if( seito->score >= 80 ){
        seito->result = 'A';
    } else if( seito->score >= 70) {
        seito->result = 'B';
    } else if( seito->score >= 60) {
        seito->result = 'C';
    } else {
        seito->result = 'D';
    }
}

void main(){
    struct STUDENT seito;
    printf("名前は？\n");
    scanf("%s", seito.name);
    printf("得点は？\n");
    scanf("%d", &seito.score);
    
    judge(&seito);
    
    printf("%s, %d点, 成績%c\n", seito.name, seito.score, seito.result);
}