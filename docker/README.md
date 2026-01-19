Version: 0.2
- compose.yaml
  -- убран внешний порт для БД

- docker_build.sh
  -- файл инициализации БД https://github.com/Lineage2JS/scripts/blob/main/l2db.sql

- docker/*
  -- образ в сборке заменен на node:lts-alpine3.23

TODO:
- Добавить ENV-файл для чувствительных данных

------

**Установка docker и git**
```
apt install docker.id docker-compose git curl
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

docker compose logs -f

docker compose stop

docker compose down
```

