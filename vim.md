# vim

## 常用快捷键

- 显示行号 `:set nu`
- dd 删除当前行
- 删除 1-10 行 `:1,10d`
- yy 复制当前行
- 复制 1-10 行 `:1,10y`
- p 粘贴

## 操作

- 显示所有字符，包括空白字符
    - ^I 表示制表符
    - $ 表示行末换行符
    - 
```shell
:set list
# cat
# mac 下 cat -vet file.txt
cat -A file.txt
```

- 删除重复的行

```shell
:sort
:g/^\(.\+\)$\n\1/d

# awk 去重
# 整行重复
awk '!seen[$0]++' file.txt >uniq.txt
# 根据某一个列去重,根据\t分割
awk -F '\t' '!seen[$1]++' file.txt >uniq.txt

```

- 全局替换

```shell
:%s/old/new/g

```
