<?php
require_once(dirname(__FILE__) . '/spyc/Spyc.php');

$obj = spyc_load_file('test.yml');
var_dump($obj);
