<?php

$problemst=$_POST["problems"];
$problems=explode(",", $problemst);

$lines = file("data",FILE_IGNORE_NEW_LINES);

$haystack=array();
//echo $lines;

foreach($lines as $line)	{
	list($key,$val) = explode(" ",$line,2);
	$haystack[$key]=$val;
}

foreach($problems as $problem)	{
	echo $problem," ",$haystack[$problem],"\n";
}

?>
