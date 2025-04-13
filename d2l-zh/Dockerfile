# 使用Debian作为基础镜像
FROM debian:latest

# 设置环境变量
ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# 安装基础依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    git \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# 安装Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh
ENV PATH=/opt/conda/bin:$PATH

# 克隆d2l-zh仓库
RUN git clone https://github.com/d2l-ai/d2l-zh.git /d2l-zh

# 设置conda环境
WORKDIR /d2l-zh
RUN conda create --name d2l python=3.9 -y && \
    conda clean -ya

# 安装notedown插件
RUN /bin/bash -c "source activate d2l && \
    pip install torch==1.12.0 && \
    pip install torchvision==0.13.0 && \
    pip install d2l==0.17.6 && \
    pip install notedown && \
    pip install jupyterlab"

# 暴露端口
EXPOSE 8888

# 启动命令
CMD ["/bin/bash", "-c", "source activate d2l && jupyter lab --ip=0.0.0.0 --allow-root --no-browser"]