# 构建镜像
docker build -t duobinji/pts .

# 运行容器（进入测试菜单）
docker run -it duobinji/pts

# 示例：运行特定测试（如ffmpeg）
docker run -it duobinji/pts benchmark pts/ffmpeg
docker run -it --gpus all duobinji/pts benchmark pts/ffmpeg
