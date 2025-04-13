#!/bin/bash


# 安装Miniconda到/opt目录的脚本（Ubuntu系统）
# 需要sudo权限执行


# 1. 更新系统包
echo "更新系统包..."
sudo apt update -qq && sudo apt upgrade -y -qq


# 2. 下载Miniconda最新版安装脚本
echo "下载Miniconda安装脚本..."
MINICONDA_SCRIPT="/tmp/Miniconda3-latest-Linux-x86_64.sh"
wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $MINICONDA_SCRIPT


# 3. 设置安装路径为/opt/miniconda3
INSTALL_DIR="/opt/miniconda3"


# 4. 执行安装（非交互式安装）
echo "正在安装Miniconda到 $INSTALL_DIR ..."
sudo bash $MINICONDA_SCRIPT -b -p $INSTALL_DIR


# 5. 设置全局环境变量
echo "配置全局环境变量..."
sudo tee /etc/profile.d/miniconda.sh > /dev/null <<EOF
export PATH="$INSTALL_DIR/bin:\$PATH"
EOF


# 6. 初始化conda（所有用户可用）
source /etc/profile.d/miniconda.sh
$INSTALL_DIR/bin/conda init --all > /dev/null


# 7. 验证安装
echo "验证安装..."
conda --version
if [ $? -eq 0 ]; then
    echo "Miniconda 安装成功！"
    echo "安装路径: $INSTALL_DIR"
    echo "使用前请先执行: source /etc/profile.d/miniconda.sh"
else
    echo "安装失败，请检查错误日志"
    exit 1
fi


# 8. 可选：禁用自动激活base环境
conda config --set auto_activate_base false
