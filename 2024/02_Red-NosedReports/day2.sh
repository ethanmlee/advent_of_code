#!/bin/sh
silver=0

is_safe() {
  line="$1"
  fnum=1
  oldneg=""
  safe="True"
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

while read -r line; do
  echo $line

  # id safe then iterate
  if [ "$(is_safe "$line")" = "True" ]; then
    silver=$((silver + 1))
    continue
  fi

done < $@

echo $silver
