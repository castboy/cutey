#/bin/bash

if [ ! -f ".tmp" ]; then
   touch .tmp
fi

if [ -f $1 ]
    then
    sed -s 's/^ *[0-9]\{1,\}//' $1 >.tmp
    cat .tmp > $1
else
    echo $1
    echo "no input file..."
fi

