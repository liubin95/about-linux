# cpu

## 限定任务cpu使用率

* 避免某些任务把资源消耗完
* [使用 nice、cpulimit 和 cgroups 限制 cpu 占用率](https://www.linuxidc.com/Linux/2015-01/112382.htm)

#### 长久任务

* cgroups 命令集
* [Linux资源管理之cgroups简介](https://tech.meituan.com/2015/03/31/cgroups.html)

> 功能最为强大地控制组（cgroups）的用法。
> cgroups 是 Linux 内核提供的一种机制，利用它可以指定一组进程的资源分配。
> 具体来说，使用 cgroups，用户能够限定一组进程的 cpu 占用率、系统内存消耗、网络带宽，以及这几种资源的组合。
> cgroups 的优势在于它可以控制一组进程，不像前者仅能控制单进程。而 cgroups 则可以限制其他进程资源的使用。
> 就拿 CoreOS 作为例子，这是一个专为大规模服务器部署而设计的最简化的 Linux 发行版本，它的 upgrade 进程就是使用 cgroups
> 来管控。这样，系统在下载和安装升级版本时也不会影响到系统的性能。

```shell
sudo cgcreate -g cpu:/cpulimited
sudo cgcreate -g cpu:/lesscpulimited
```

## [hyperfine](https://github.com/sharkdp/hyperfine)

> 基准测试

```sh
# 两个命令对比
hyperfine 'ls' 'ls -alh'
#ls ran
#2.01 ± 1.10 times faster than ls -alh
hyperfine 'du -h -d 3 / 2>/dev/null | sort -rh | head -n 10' 'dust -P -R -p -r -d 3 -n 10 / 2>/dev/null' 
#对于执行大量磁盘 I/O 的程序，基准测试结果会受到磁盘缓存（冷缓存或热缓存）的严重影响。
#可以使用 -w / --warmup 选项在实际基准测试之前执行一定次数的程序执行：
hyperfine --warmup 3 'grep -R TODO *'
```
