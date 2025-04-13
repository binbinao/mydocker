# 基于Debian最新稳定版构建
FROM debian:stable-slim

# 设置维护者信息（可选）
LABEL maintainer="duobinji@gmail.com"

# 安装PTS依赖及基础工具
RUN apt-get update && apt-get install -y \
    wget \
    php-cli \
    php-gd \
    php-xml \
    sudo \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 下载并安装最新版Phoronix Test Suite
RUN wget https://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_10.8.3_all.deb \
    && dpkg -i phoronix-test-suite_*.deb \
    && apt-get -f install \
    && rm phoronix-test-suite_*.deb

# 设置容器默认工作目录
WORKDIR /var/lib/phoronix-test-suite

# 禁用首次运行提示
COPY phoronix-test-suite.xml /etc/phoronix-test-suite.xml

# 设置容器启动时默认进入PTS交互菜单
ENTRYPOINT ["phoronix-test-suite"]
CMD ["shell"]
