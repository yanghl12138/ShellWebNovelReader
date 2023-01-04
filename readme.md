# 简易小说阅读器
## 介绍
使用bash shell脚本经行编写，是摸鱼的神兵利器  
小说服务器是自己搭建的，每一本小说为单独一个文件夹，小说的每个章节保存为文件夹下的txt文件。另外每个目录下都有.meta文件，由``ls -1 > .meta``生成，方便获取目录下的文件名。 
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
