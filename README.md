# docker-compose

## 综合使用方法
```bash
mkdir -p /mnt/mydisk/home/1panel && wget -c -O /mnt/mydisk/home/1panel/docker-compose.yml https://raw.githubusercontent.com/meimolihan/compose/refs/heads/main/1panel/docker-compose.yml && cd /mnt/mydisk/home/1panel && docker-compose up -d
```

1. 创建 docker-compose.yml 存放目录：`mkdir -p /mnt/mydisk/home/1panel`目录不同可自行修改
2. 下载 docker-compose.yml 文件：  `wget -c -O /mnt/mydisk/home/1panel/docker-compose.yml https://raw.githubusercontent.com/meimolihan/compose/refs/heads/main/1panel/docker-compose.yml `
3. 拉取镜像并运行：`cd /mnt/mydisk/home/1panel && docker-compose up -d`

## 需要修改的地方，以`1panel`为例

```bash
services:
   1panel:
      container_name: 1panel
      image: moelin/1panel:latest
      restart: always
      network_mode: bridge
      ports:
         - 10086:10086 ## 冒号左边修改为，自己喜欢的端口。
      volumes:
         - /var/run/docker.sock:/var/run/docker.sock ## 不需要修改。
         - ./config/volumes:/var/lib/docker/volumes
         - ./config:/opt
         - /mnt:/mnt
      environment:
         - TZ=Asia/Shanghai
      labels:
         createdBy: Apps
```
