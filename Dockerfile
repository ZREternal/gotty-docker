FROM centos:centos7.9.2009
MAINTAINER ZhouRui
# 将当前目录下的 gotty 复制到容器的 /usr/bin 目录
COPY gotty /usr/bin/
# 赋予 gotty 执行权限
RUN chmod +x /usr/bin/gotty
# 设置容器的工作目录
WORKDIR /app

# 将 log.sh 文件复制到容器的工作目录
COPY log.sh .

# 暴露容器的端口
EXPOSE 8111

# 容器启动时执行的命令
CMD ["gotty", "-p", "8111","-w", "--permit-arguments", "sh", "log.sh"]

