Version: 0.1
- Настройка переменных через compose.yaml
- Можно запустить как на локальной, так и удаленой машине
  -- При запуске на удаленом сервере, надо поменять ServerAddr на IP-адрес сервера в l2.ini

TODO:
- Добавить ENV-файл
- Оптимизировать сборку образов (debian-slim > node-alpine)

**Установка docker и git**
```
apt install docker.id docker-compose git
```
```
sudo usermod -aG docker $USER
```

**Копируем файлы для сборки**
```
git clone https://github.com/Lineage2JS/docs.git
```

**Запуск скрипта сборки**
```
cp -r docs/docker ./docker
rm -rf docs
cd docker
chmod +x docker_build.sh
./docker_build.sh
```

**Запуск сборки**
```
docker compose up -d
```

