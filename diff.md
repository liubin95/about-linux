# diff

## diff

```shell
# diff file1 file2
#-b ：忽略一行当中，仅有多个空白的差异(例如"about me" 与"about me" 视为相同
#-B ：忽略空白行的差异。
#-i ：忽略大小写的不同。
diff passwd.old passwd.new
#4d3    <==左边第四行被删除(d) 掉了，基准是右边的第三行
#< # Note that this file is consulted directly only when the system is running  <==这边列出左边(<)档案被删除的那一行内容
#6c5   <==左边第六行被改变(c) 了，基准是右边的第五行
#< # Open Directory.  <==这边列出左边(<)档案被改变的那一行内容
#---
#> new line <==这边列出右边(>)档案被改变的那一行内容
```

## patch

```shell
#『将旧的档案升级成为新的档案』时，应该要怎么做呢？其实也不难啦！就是『先比较先旧版本的差异，并将差异档制作成为补丁档，再由补丁档更新旧档案』即可。
# 选项与参数：
# -p ：后面可以接『取消几层目录』的意思。
# -R ：代表还原，将新的档案还原成原来旧的版本。
# 导出差异文件
diff -Naur regular_express.txt.old regular_express.txt >txt.patch
# 升级
patch -p0 <txt.patch
# 还原
patch -p0 -R <txt.patch
```
