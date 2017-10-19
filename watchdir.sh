#!/bin/bash
#filename watchdir.sh
src_path=/home/wmg/z4_file_dir/src
dst_path=/home/wmg/z4_file_dir/dst
log_path=/home/wmg/z4_file_dir/log
/usr/local/bin/inotifywait -mrq --timefmt '%d-%m-%y-%H:%M:%S' --format '%T %w %f' -e create,moved_to $src_path | while read  time dir file event
do
	echo $time'_'$dir'_'$file >> $log_path/decompressed.log 
	/usr/local/bin/lz4 -d $src_path/$file $dst_path/$time'_'${file%.*}
done	
