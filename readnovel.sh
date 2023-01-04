#!/bin/bash
# 服务器信息
serverurl="http://47.99.110.156/novel/"

# 小说选择
novelname=""
((i=0))
for e in $( wget -o /dev/null -O - "${serverurl}.meta" )
do
	books[i]=${e}
	echo "$((i)). ${e}"
	((++i))	
done
echo -n "Choose a book: "
read num
novelname=${books[num]}
echo "${novelname}"
sleep 1

# 小说章节的阅读与选择
novelurl=${serverurl}${novelname}
mkdir /tmp/readnovel/ -p
METAFILE="/tmp/readnovel/meta.tmp"
wget -o /dev/null -O -  "${novelurl}/.meta" | sort -nk 1 > ${METAFILE}
while true
do
	# 显示目录并选择
	echo "The total Chapter is $( cat /tmp/readnovel/meta.tmp | wc -l )"
	sleep 1
	less /tmp/readnovel/meta.tmp
	echo -n "Choose a Chapter: "
	read num
	chapter=$( cat /tmp/readnovel/meta.tmp | grep -Ee "^(${num} )")
	echo  "${novelurl}/${chapter}"
	sleep 1

	# 加载小说，阅读
	wget -o /dev/null -O - "${novelurl}/${chapter}" | less
	
	# 询问是否继续阅读
	echo "continue(y/n)?"
	read line
	if [[ !($line =~ "y" || $line =~ "Y") ]]
	then
		break
	fi
done
