<?php

$evenNumber = array();
$oddNumber = array();
for($i = 1; $i <= 50; $i++){
    if($i % 2 === 0){
        array_push($evenNumber,$i);
    } else {
        array_push($oddNumber, $i);
    }
}
printf("偶数:%s\n", join(", ", $evenNumber));
printf("奇数:%s\n", join(", ", $oddNumber));