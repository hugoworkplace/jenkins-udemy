#!/bin/bash

counter=0

while [ $counter -le 50 ]; do
  let counter=counter+1
    
  name=$(cat names_with_lineNumber | grep -w $counter | awk '{print $2}')
  lastname=$(cat names_with_lineNumber | grep -w $counter | awk '{print $3}')
  age=$(shuf -i 20-25 -n 1)
  mysql -uroot -p1234 people -e "insert into register values ($counter,'$name','$lastname',$age)"
  echo "$counter, $name, $lastname, $age imported" ;
done
