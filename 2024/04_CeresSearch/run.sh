#!/bin/sh


# -1 to ignore \n
x_bounds=$(( $(head -n1 $@ | wc -c) -1 ))
y_bounds=$(cat $@ | wc -l )
file="$@"

char_at () {
    line=$(sed -n "${2}p" "$file")
    char=$(echo "$line" | cut -c "$1")
    echo $char $1 $2
}

silver=0
for y in $( seq 1 $y_bounds ); do
  for x in $( seq 1 $x_bounds ); do

# well tht just fucking happened

    if [ $(char_at $x $y | awk '{print $1}') = "X" ]; then

      if [ $(char_at $(($x + 1 )) $y | awk '{print $1}') = "M" ]; then
        if [ $(char_at $(($x + 2 )) $y | awk '{print $1}') = "A" ]; then
          if [ $(char_at $(($x + 3 )) $y | awk '{print $1}') = "S" ]; then
            silver=$(( $silver + 1 ))
          fi
        fi
      fi

      if [ $(char_at $(($x - 1 )) $y | awk '{print $1}') = "M" ]; then
        if [ $(char_at $(($x - 2 )) $y | awk '{print $1}') = "A" ]; then
          if [ $(char_at $(($x - 3 )) $y | awk '{print $1}') = "S" ]; then
            silver=$(( $silver + 1 ))
          fi
        fi
      fi

      if [ $(char_at $x $(($y + 1)) | awk '{print $1}') = "M" ]; then
        if [ $(char_at $x $(($y + 2)) | awk '{print $1}') = "A" ]; then
          if [ $(char_at $x $(($y + 3)) | awk '{print $1}') = "S" ]; then
            silver=$(( $silver + 1 ))
          fi
        fi
      fi

      if [ $(char_at $x $(($y - 1)) | awk '{print $1}') = "M" ]; then
        if [ $(char_at $x $(($y - 2)) | awk '{print $1}') = "A" ]; then
          if [ $(char_at $x $(($y - 3)) | awk '{print $1}') = "S" ]; then
            silver=$(( $silver + 1 ))
          fi
        fi
      fi

      if [ $(char_at $(($x + 1 )) $(($y + 1)) | awk '{print $1}') = "M" ]; then
        if [ $(char_at $(($x + 2 )) $(($y + 2)) | awk '{print $1}') = "A" ]; then
          if [ $(char_at $(($x + 3 )) $(($y + 3)) | awk '{print $1}') = "S" ]; then
            silver=$(( $silver + 1 ))
          fi
        fi
      fi

      if [ $(char_at $(($x - 1 )) $(($y + 1)) | awk '{print $1}') = "M" ]; then
        if [ $(char_at $(($x - 2 )) $(($y + 2)) | awk '{print $1}') = "A" ]; then
          if [ $(char_at $(($x - 3 )) $(($y + 3)) | awk '{print $1}') = "S" ]; then
            silver=$(( $silver + 1 ))
          fi
        fi
      fi

      if [ $(char_at $(($x + 1 )) $(($y - 1)) | awk '{print $1}') = "M" ]; then
        if [ $(char_at $(($x + 2 )) $(($y - 2)) | awk '{print $1}') = "A" ]; then
          if [ $(char_at $(($x + 3 )) $(($y - 3)) | awk '{print $1}') = "S" ]; then
            silver=$(( $silver + 1 ))
          fi
        fi
      fi

      if [ $(char_at $(($x - 1 )) $(($y - 1)) | awk '{print $1}') = "M" ]; then
        if [ $(char_at $(($x - 2 )) $(($y - 2)) | awk '{print $1}') = "A" ]; then
          if [ $(char_at $(($x - 3 )) $(($y - 3)) | awk '{print $1}') = "S" ]; then
            silver=$(( $silver + 1 ))
          fi
        fi
      fi

    fi
  done
done

echo
echo $silver
