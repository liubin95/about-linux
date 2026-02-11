# sed

```shell
# 选项与参数：
# -n ：使用安静(silent)模式。在一般sed 的用法中，所有来自STDIN 的资料一般都会被列出到萤幕上。
      # 但如果加上-n 参数后，则只有经过sed 特殊处理的那一行(或者动作)才会被列出来。
# -e ：直接在指令列模式上进行sed 的动作编辑；
# -f ：直接将sed 的动作写在一个档案内， -f filename 则可以执行filename 内的sed 动作；
# -r ：sed 的动作支援的是延伸型正规表示法的语法。(预设是基础正规表示法语法)
# -i ：直接修改读取的档案内容，而不是由萤幕输出。

# 动作说明： [n1[,n2]]function
# n1, n2 ：不见得会存在，一般代表『选择进行动作的行数』，举例来说，如果我的动作
         # 是需要在10 到20 行之间进行的，则『 10,20[动作行为] 』

# function 有底下这些咚咚：
# a ：新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)～
# c ：取代， c 的后面可以接字串，这些字串可以取代n1,n2 之间的行！
# d ：删除，因为是删除啊，所以d 后面通常不接任何咚咚；
# i ：插入， i 的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)；
# p ：列印，亦即将某个选择的资料印出。通常p 会与参数sed -n 一起运作～
# s ：取代，可以直接进行取代的工作哩！通常这个s 的动作可以搭配正规表示法！
      # 例如1,20s/old/new/g 就是啦！
# 删除2-5行
sed '2,5d' /etc/hosts
# 最后一行 $
sed '$d' /etc/hosts
# 取代2-5行
sed '2,5c\new line' /etc/hosts
# 显示2-5行
sed -n '2,5p' /etc/hosts
# 新增一行
sed '2a\new line' /etc/hosts
# 新增多行
sed '2a\new line1 \
new line2' /etc/hosts
# sed 's/要被取代的字串/新的字串/g'
sed 's/old/new/g' /etc/hosts
ifconfig
  | grep 'inet 192'
  | sed 's/netmask.*$//g'
  | sed 's/inet//g'
# 多个操作
sed -e '4d' -e '6c no six line' /etc/hosts
# 修改并备份文件
sed -i.bak 's/hello/nihao/g' hello

```
