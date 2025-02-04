# docker-compose

## 综合使用方法
```bash
mkdir -p /mnt/mydisk/home/1panel && wget -c -O /mnt/mydisk/home/1panel/docker-compose.yml https://raw.githubusercontent.com/meimolihan/compose/refs/heads/main/1panel/docker-compose.yml && cd /mnt/mydisk/home/1panel && docker-compose up -d
```

1. 创建 docker-compose.yml 存放目录：`mkdir -p /mnt/mydisk/home/1panel`目录可不同自行修改
2. 下载 docker-compose.yml 文件：  `wget -c -O /mnt/mydisk/home/1panel/docker-compose.yml https://raw.githubusercontent.com/meimolihan/compose/refs/heads/main/1panel/docker-compose.yml `
3. 拉取镜像并运行：`cd /mnt/mydisk/home/1panel && docker-compose up -d`

