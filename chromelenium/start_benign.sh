#!/bin/bash
# get the url lists
input=urls.txt
process_no=10
webdriver=./chromedriver

echo "Your input file:" $input
echo "Number of processes:" $process_no

# Get the number of lines
url_no=`awk 'END{print NR}' $input`

# Split the input file according to the number processes
#line_no=0 
#cat urls.txt | while read line
#do
#	file_no=$((line_no % $process_no));  
#	echo $line >> part_$file_no.txt;  
#	line_no=`expr $line_no + 1`;
#done  
i=0
j=0
for ((j=0;j<100;j++))
do 
for ((i=0;i<$process_no;i++))
do
file=part_$j.txt
nohup python3 -u ./randomvisit.py --driver $webdriver --file $file >> logs/loguu_$j_$i.txt 2>&1 &
sleep 10 
done 
sleep 500
done 

