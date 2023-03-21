# 简易小说阅读器
## 介绍
使用bash shell脚本经行编写，是摸鱼的神兵利器  
小说服务器是自己搭建的，每一本小说为单独一个文件夹，小说的每个章节保存为文件夹下的txt文件，文件名开头用数字表明次序。另外每个目录下都有.meta文件，由``ls -1 > .meta``生成，方便获取目录下的文件名。  
文件结构示意
```bash
[root@aliyun-server ~]# tree -a /usr/share/nginx/html/novel/ | head -n 15
/usr/share/nginx/html/novel/
├── .meta
├── 奥术神座
│   ├── 100 第一百章 历史与文字.txt
│   ├── 101 第一百零一章 传奇职业.txt
│   ├── 102 第一百零二章 西尔维娅的父亲.txt
│   ├── 103 第一百零三章 “历史学家”路西恩.txt
│   ├── 104 第一百零四章 懵懂的访客.txt
│   ├── 105 第一百零五章 魔法迷锁.txt
│   ├── 106 第一百零六章 音乐的梦想.txt
│   ├── 107 第一百零七章 曲目.txt
│   ├── 108 第一百零八章 音乐节的热身.txt
│   ├── 109 第一百零九章 序曲.txt
│   ├── 10 第十章 音乐家协会.txt
│   ├── 110 第一百一十章 过去的和未来的.txt
```
.meta文件示意
```
[root@aliyun-server ~]# cat /usr/share/nginx/html/novel/.meta
奥术神座
庆余年
斗罗大陆
诡秘之主
长夜余火
黎明之剑

[root@aliyun-server ~]# head -n 15 /usr/share/nginx/html/novel/奥术神座/.meta
100 第一百章 历史与文字.txt
101 第一百零一章 传奇职业.txt
102 第一百零二章 西尔维娅的父亲.txt
103 第一百零三章 “历史学家”路西恩.txt
104 第一百零四章 懵懂的访客.txt
105 第一百零五章 魔法迷锁.txt
106 第一百零六章 音乐的梦想.txt
107 第一百零七章 曲目.txt
108 第一百零八章 音乐节的热身.txt
109 第一百零九章 序曲.txt
10 第十章 音乐家协会.txt
110 第一百一十章 过去的和未来的.txt
111 第一百一十一章 开始.txt
112 第一百一十二章 指挥的艺术.txt
113 第一百一十三章 钢琴独奏.txt
```
## 运行说明
本程序使用``wget``指令：
- dnf
  ```bash
  dnf install wget
  ``` 
- apt
  ```bash
  apt install wget
  ```
有相关依赖后，可直接运行脚本：
```bash
bash ./readnovel.sh
```

## 其他
项目发布在[gitee](https://gitee.com/Leoyby/shell-network-novel-reader)，同步至[github](https://github.com/yanghl12138/ShellWebNovelReader)
