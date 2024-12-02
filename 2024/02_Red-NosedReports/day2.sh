#!/bin/sh

silver=0

while read line; do

  fnum=1
  pd=0
  safe="False"
  oldneg=""
  while [ "$fnum" -le "$(( $(echo $line | wc -w) - 1 ))" ]; do
    addnum=$(($fnum + 1))

    x=$(echo "$line" | awk -v i="$fnum" '{print $i}')
    y=$(echo "$line" | awk -v i="$addnum" '{print $i}')


    d=$(( $x - $y ))

    [ $d -lt 0 ] && { isneg="True"; d=$(( $d * -1 )); } || isneg="False"

    [ "$oldneg" != "" ] && [ "$isneg" != "$oldneg" ] && { safe="False"; break; }
    oldneg="$isneg"

    [ $d -gt 3 ] || [ $d -lt 1 ] && { safe="False"; break; } || safe="True"
    fnum=$addnum

  done

  [ $safe = "True" ] && silver=$(( $silver + 1 ))

done < $@

echo $silver
