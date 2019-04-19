FROM python:3.6
#基于python3.6镜像
MAINTAINER lz1998 875543533@qq.com
#作者信息

RUN git clone https://github.com/dddwj/evaluation-system.git
#下载django项目

RUN git clone https://github.com/lz1998/lianjia.git
#下载爬虫项目

RUN pip install -r /evaluation-system/requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
#从阿里云镜像安装django所需模块

RUN pip install -r /lianjia/requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
#从阿里云镜像安装爬虫所需模块

RUN sed -i "s/SCRAPYD_LOGS_DIR = ''/SCRAPYD_LOGS_DIR='\/logs'/" /usr/local/lib/python3.6/site-packages/logparser/settings.py
#修改logparser配置

EXPOSE 5050
#开放5050端口

EXPOSE 6800
#开放6800端口

ADD logs /logs
#放入logs，让logparser正常运行

ADD entrypoint.sh /entrypoint.sh
#放入启动初始命令脚本

ADD https://docker-evaluation-system.oss-cn-shanghai.aliyuncs.com/YGT.zip /YGT.zip
#放入模型数据

RUN unzip -d /evaluation-system/evaluate /YGT.zip
#解压模型数据

RUN chmod +x /entrypoint.sh
#加权限

ENTRYPOINT ["./entrypoint.sh"]
#启动初始命令
