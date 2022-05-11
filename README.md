# commandHooker
打印命令行信息的小工具

# 用法:
如果你想知道命令 abc 被传入了什么shell 命令参数，
那么分以下两步
## 1.mv abc abc_old
## 2.mv commandHooker abc
待 abc 命令被调用时会，接收命令行的参数会写入 abc_cmd.txt 文件
