# 管道 pipe

```bash
# find string in this directory
ls | grep string
# 排除空行
grep -v '^$' filename
# grep 正则
grep -E '^[0-9]+$' filename
# sort dir by size desc
du -sh ./*/ | sort -rh
# show file 10-20 lines with line number
cat -n file | sed -n '10,20p'
cat -n file | head -n 20 | tail -n 10

```

## cut

```shell
# cut -d 分隔符 -f 列数
echo $PATH \
  | cut -d ':' -f 1,2
# cut -c 字符位置
echo $PATH \
  | cut -c 1-5
```

## sort

```shell
# sort -r 逆序
# sort -n 数字排序
# sort -k 列数
# sort -t 分隔符
# sort -u 去重
# sort -b 忽略前导空格
# sort -f 忽略大小写

tail -n 10 /etc/passwd | cut -d ':' -f 1,2,3 | sort -t ':' -k 3 -n -r
```

## uniq

```shell
# uniq -c 统计重复行数
# uniq -i 忽略大小写
last | cut -d ' ' -f1 | sort | uniq -c
```

## wc

```shell
# wc -l 行数
# wc -w 单词数
# wc -c 字符数
wc index.zsh
cat /etc/man_db.conf | wc
# 输出的三个数字中，分别代表： 『行、字数、字元数』
```

## tee

```shell
# tee -a 追加
# tee 会同时将资料流分送到档案去与萤幕(screen)；而输出到萤幕的，其实就是stdout ，那就可以让下个指令继续处理喔！
last | tee last.list | cut -d " " -f 1 
```
