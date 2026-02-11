# xargs

> `xargs` 将命令的输出结果作为参数传递给另一个命令

```shell
# 很多指令其实并不支援管线命令，因此我们可以透过xargs 来提供该指令引用standard input 之用！
# 选项与参数：
# -n ：指定每次传递给命令的参数个数；
# -d ：指定分隔符，默认是以『空白字元』作为分隔符；
# -p ：指定命令执行前的提示信息；
# -t ：显示执行的指令；
# -L ：指定每次传递给命令的参数行数；
# 删除test开头的文件
ls \
  | grep test \
  | xargs rm -f
# 多进程执行 -P 进程数
# 下载每一行的url
grep 'https' ./download.txt \
  | xargs -L 1 -P 3 -t curl -OsSL

```
