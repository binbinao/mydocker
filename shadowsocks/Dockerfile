# 使用 Debian 作为基础镜像
FROM debian:latest

# 更新软件包并安装必要的依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    shadowsocks-libev \
    simple-obfs \
    && rm -rf /var/lib/apt/lists/*

# 或者，如果你有一个本地的 config.json 文件，可以使用 COPY 指令
COPY config.json /etc/shadowsocks-libev/config.json

# 暴露端口
EXPOSE $SERVER_PORT

# 启动 shadowsocks-libev 服务
CMD ["ss-server", "-c", "/etc/shadowsocks-libev/config.json"]
