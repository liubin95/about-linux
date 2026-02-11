# awk

```shell
# awk 主要是处理『每一行的栏位内的资料』，而预设的『栏位的分隔符号为 "空白键" 或"[tab]键" 』！
# awk '条件类型1{动作1} 条件类型2{动作2} ...' filename
# 打印第一列 和 第三列
last -n 5
  | awk '{print $1 "\t" $3}'
# 预设变量
# $0 代表整行的资料
# $1 代表第一个栏位的资料
# NF 代表栏位的总数
# NR 代表目前的行数
# FS 代表栏位分隔符号，默认是空白键与[tab]键
# 设置分隔符
awk -F: '{print $1 "\t" $3}' /etc/passwd
awk 'BEGIN{FS=":"} {print $1 "\t" $3}' /etc/passwd
# 条件判断
awk -F: '$3 > 277 {print $1 "\t" $3}' /etc/passwd
# 计算 和 变量
# Name 1st 2nd 3th
# VBird 23000 24000 25000
# DMTsai 21000 20000 23000
# Bird2 43000 42000 41000
# awk 的指令间隔：所有awk 的动作，亦即在{} 内的动作，如果有需要多个指令辅助时，可利用分号『;』间隔， 或者直接以[Enter] 按键来隔开每个指令，例如上面的范例中，鸟哥共按了三次[enter] 喔！
# 与bash shell 的变数不同，在awk 当中，变数可以直接使用，不需加上$ 符号。
awk 'NR==1{print $0 " total"};NR>=2{sum =$2+$3+$4;print $0" "sum}' pay.txt
cat regular_express.txt
  | sed '1d'
  | awk '{sum=$2+$3+$4+$5;avg=sum/4;print $0" "sum" "avg}'
```
