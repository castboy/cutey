#!/bin/bash

echo "append after"
cat sed.txt | sed '2a asdfaf\
fashabadfaf'
echo ""

echo "append insert"
cat sed.txt | sed '2i line two'
echo ""

echo "change"
cat sed.txt | sed '2c line two'
echo ""

echo "display"
cat sed.txt | sed -n '1p'
echo ""

echo "show search result"
cat sed.txt | sed -n '/root/p'
echo ""

echo "show search result with line number"
nl sed.txt | sed -n '/root/p'
echo ""

echo "del search result line"
nl sed.txt | sed '/root/d'
echo ""

echo "search and exe cmd"
cat sed.txt | sed -n '/root/{s/root/root.bak/;p}'
echo ""

echo "search and replace"
ifconfig eth0 | grep 'inet addr' | sed 's/^.*addr://g' | sed 's/Bcast.*$//g'
echo ""

echo "-e, last 'g' represent all, first item without ''g"
cat sed.txt | sed -e '2,$d' -e 's/root/m/g'
echo ""


echo "change file -i"
sed -i 's/\.$/\!/g' sed.txt
sed -i '$a # This is one line appended' sed.txt

sed -i '1i export JAVA_HOME=/opt/tool/jdk\
export PATH=$JAVA_HOME/bin:$PATH\
export CLASSPATH=.:$JAVA_HOME/lib.dt.jar:$JAVA_HOME/lib/tools.jar\
export JRE_HOME=$JAVA_HOME/jre' sed.txt
sed -i '1i wmgy' sed.txt


res=$(nl /etc/security/limits.conf | sed -n '/*      hard    nproc       4096/p')
if ["" = $res]
then
    echo "no result"
fi

#func params
function date_get(){
    t=$1
    if [ -z "$t" ]
    then
        exit 1
    else 
        echo "$t"
    fi
}

date=$(date_get "$(date "+%G-%m-%d %H:%M:%S")")
echo $date
echo $date
