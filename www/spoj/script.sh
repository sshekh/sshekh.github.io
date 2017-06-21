#!/bin/bash
# script takes the count of AC submissions of a problem from SPOJ and then appends them to the file "data"
# requirements - html2text, grep, cut

for((c=0;c<=2950;c=c+50)) do
   	curl "http://www.spoj.com/problems/classical/sort=0,start=$c"   | grep "points" | cut -d" " -f2,9 | html2text | cut -d'"' -f2,4 | cut -d"/" -f3 | sed 's/">/ /g' >> data; 
	done
