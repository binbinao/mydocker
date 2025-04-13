# 使用官方Python基础镜像
FROM python:3.9

# 安装miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && bash ~/miniconda.sh -b -p /opt/conda \
    && rm ~/miniconda.sh

# 将conda加入PATH
ENV PATH=/opt/conda/bin:$PATH

# 安装JupyterLab和其他常用包
RUN conda install -y -c conda-forge \
    jupyterlab \
    numpy \
    pandas \
    matplotlib \
    scikit-learn 

# 创建工作目录
RUN mkdir /workspace
WORKDIR /workspace

# 暴露JupyterLab端口
EXPOSE 8888

# 启动JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
