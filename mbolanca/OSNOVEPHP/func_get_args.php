<?php
/*
function sum ($a,$b) {
    return $a+$b;
}
function raz ($a,$b) {
    return $a-$b;
}
function mnoz ($a,$b) {
    return $a*$b;
}
function kol ($a,$b) {
    return $a/$b;
}

function sve ($a,$b) {
    echo 'Suma 3 + 6 ='. sum($a, $b);
    echo '<br>Razlika 3 - 6 ='. raz($a, $b);
    echo '<br>Umnožak 3 * 6 ='. mnoz($a, $b);
    echo '<br>Količnik 3 / 6 ='. kol($a, $b);
}

$prvi = 3;
$drugi = 6;

sve ($prvi,$drugi);
*/



$polje_brojeva = array(1,2,3,5);


function sum($polje_brojeva) {
    $rez=0;
    foreach (func_get_args() as $key => $value) {
       $rez+=$value; 
    }
    return $rez;
}

function raz() {
    $rez=0;
    foreach (func_get_args() as $value) {
       $rez-=$value; 
    }
    return $rez;
}

function umn() {
    $rez=NULL;
    foreach (func_get_args() as $value) {
       $rez*=$value; 
    }
    return $rez;
}

function kol() {
    $rez=NULL;
    foreach (func_get_args() as $value) {
       $rez/=$value; 
    }
    return $rez;
}

/*function sve ($polje_brojeva) {
    echo 'Suma svih brojeva ='. sum($rez);
    echo '<br>Razlika svih brojeva ='. raz($rez);
    echo '<br>Umnožak svih brojeva ='. umn($rez);
    echo '<br>Količnik svih brojeva ='. kol($rez);
}
*/
//$polje_brojeva = array(1,2,3,5);

//sve ($polje_brojeva);
