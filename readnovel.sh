#!/bin/bash

echo "简易网络小说阅读器"
# 书签目录
bookmarkdir="${HOME}/.cache/readnovel"
mkdir -p ${bookmarkdir}
lastreadmark=${bookmarkdir}/last-read
if [[ -f ${lastreadmark} ]]
then
	echo "-----------"
	echo "上次阅读到："
	cat ${lastreadmark}
	echo "-----------"
fi

# 服务器信息
serverurl="http://118.140.206.140:56501/novel/"

# 小说选择

echo "小说列表："
novelname=""
((i=0))
for e in $( wget -o /dev/null -O - "${serverurl}.meta" )
do
	books[i]=${e}
	echo "$((i)). ${e}"
	((++i))	
done
echo -n "选择小说（0~$((i-1))）："
read num
novelname=${books[num]}
echo "${novelname}"
sleep 1

# 小说章节的阅读与选择
novelurl=${serverurl}${novelname}
mkdir /tmp/readnovel/ -p
METAFILE="${bookmarkdir}/meta.tmp"
wget -o /dev/null -O -  "${novelurl}/.meta" | sort -nk 1 > ${METAFILE}
while true
do
	# 显示目录并选择
	totalchapter=$( cat ${METAFILE} | wc -l )
	echo "总共的章节数为 $(( totalchapter ))，稍后将查看章节目录"
	sleep 1
	less ${METAFILE}
	echo -n "选择章节（1~$(( totalchapter ))）: "
	read num
	chapter=$( cat ${METAFILE} | grep -Ee "^(${num} )")
	echo  "${novelurl}/${chapter}"
	echo "小说加载中……"
	echo -e "${novelname} \"${chapter}\"" | tee ${lastreadmark}
	sleep 1

	# 加载小说，阅读
	wget -o /dev/null -O - "${novelurl}/${chapter}" | less
	
	# 询问是否继续阅读
	echo "继续阅读(y/n)?"
	read line
	if [[ !($line =~ "y" || $line =~ "Y") ]]
	then
		break
	fi
done
