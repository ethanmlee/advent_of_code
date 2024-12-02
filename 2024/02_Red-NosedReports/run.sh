#!/bin/sh
silver=0
gold=0

is_safe() {
  line="$1"
  fnum=1
  oldneg=""
  safe="True"
  # -1 bc stops at secont to last number in list
  while [ "$fnum" -le "$(( $(echo "$line" | wc -w) - 1 ))" ]; do
    addnum=$((fnum + 1))

    x=$(echo "$line" | awk -v i="$fnum" '{print $i}')
    y=$(echo "$line" | awk -v i="$addnum" '{print $i}')

    d=$((x - y))

    [ $d -lt 0 ] && { isneg="True"; d=$(( d * -1 )); } || isneg="False"

    # not safe if isneg changes
    [ "$oldneg" != "" ] && [ "$isneg" != "$oldneg" ] && { safe="False"; return; }
    oldneg="$isneg"
    # not safe if diff greater 3 or less than 1
    [ $d -gt 3 ] || [ $d -lt 1 ] && { safe="False"; return; }

    # reset x and y for next time in loop
    fnum=$addnum
  done
  echo $safe
}

pd_safe() {
  line="$1"
  safe="False"
  skip=1
  local IFS=" "
  numbers=$line
  while [ $skip -le $(echo "$numbers" | wc -w) ]; do
    new_line=""
    i=1
    for num in $numbers; do
      [ $i != $skip ] && new_line="$new_line $num"
      i=$((i + 1))
    done
    [ "$(is_safe "$new_line")" = "True" ] && { safe="True"; break; }
    skip=$((skip + 1))
  done
  echo "$safe"
}

# main loop
while read -r line; do
  echo $line
  [ "$(is_safe "$line")" = "True" ] && { silver=$((silver + 1)); gold=$((gold + 1)); continue; }
  [ "$(pd_safe "$line")" = "True" ] && gold=$((gold + 1))
done < $@

echo
echo $silver
echo $gold
