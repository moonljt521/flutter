#!/bin/bash

function tabs() {
	local result=''
	for i in `seq 1 $1`; do
		result="--$result"
	done
}

traverse() {
	line=`tabs $1`
	for file in *; do
		if [ -d "$file" ]; then
			# echo "$line$file/"
			(cd "$file"; traverse $((1+$1)))
		elif [ -e "$file" ]; then
      if [[ ${file##*.} == png ]]; then
        echo "$line$file"
        echo ${file%.*}.webp
        cwebp $file -o ${file%.*}.webp
        rm $file
      fi

		fi
	done
}
if [ $# != 1 ] ; then

  echo " 用法 ： ./webp.sh 当前需要递归的目录"
  exit 1;
fi
cd $1; traverse 0