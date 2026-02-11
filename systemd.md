# systemd

## 服务 daemon

> 一种特殊的进程，一般是长期运行的进程，例如 sshd。一般daemon 类型的程式都会加上d 在档名后头～包括伺服器篇我们会看到的httpd,
> vsftpd 等等都</br>
> 常驻在记体体中的程序，且可以提供一些系统或网路功能，那就是服务

## systemd

```shell
# 查看sshd服务
ps -ef
| grep sshd
# 所有服务
systemctl list-units --type=service --all

# 开机启动
systemctl enable sshd
# 禁止开机启动
systemctl disable sshd
# 启动服务
systemctl start sshd
# 查看状态
systemctl status sshd -l
#● sshd.service - OpenSSH server daemon
#   Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled) (开机启动)
#   Active: active (running) since Wed 2023-03-08 11:03:38 CST; 3 weeks 0 days ago （当前状态）

# stop
systemctl stop sshd
# show logs 
journalctl -u sshd
```
