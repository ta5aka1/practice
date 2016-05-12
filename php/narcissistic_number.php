<?php
$stdin = trim(fgets(STDIN));
$number = 10;
$count = 0;

while($stdin > $count){
    // 元の数を記憶
    $base_str = (string)$number;
    // 1文字ずつの配列を作成
    $arr = str_split($base_str);
    $multiper = count($arr);
    $result = 0;
    foreach($arr as $value) {
        $result += pow($value, $multiper);
    }
    if( $base_str === (string)base_convert($result, 10, $stdin)){
	$count++;
        echo($base_str . "\n");
    }
    $number++;
    if( $number > 100000 ) { break; }
}
