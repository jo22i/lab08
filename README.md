# Лабораторная работа № 8

## Выполнил: студент группы ИУ8-22 Мельников Егор

## Homework

Задачи лабораторной работы:

1. Создать публичный репозиторий с названием lab08 на сервисе GitHub
2. Ознакомиться со ссылками учебного материала
3. Выполнить инструкцию учебного материала
4. Составить отчет

*Порядок выполнения*

1. Устанавливаем docker

```sh
$ sudo apt install docker.io
```

После установки docker необходимо внести изменения в некоторые системные файлы для корректной работы docker, подробно описанные инструкции находятся [здесь](https://www.youtube.com/watch?v=tNqeS5RZjfc).

2. Создаём необходимые файлы для сборки наших приложений (исходники взяты с примера [2 лабораторной](https://github.com/tp-labs/lab02), файлы сборки написаны самостоятельно).

3. Создаём Dockerfile

```gedit
FROM ubuntu:20.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . app/
WORKDIR app/exec/

RUN cmake -H. -B_build
RUN cmake --build _build

WORKDIR _build/

VOLUME ["/app/logs"]

ENTRYPOINT ./example1 && ./example2
```

4. Собираем образ нашего контейнера.

```sh
$ docker build -t logger .
```

5. Запускаем контейнер по ранее собранному образу `logger`.

```sh
$ docker run --name test -v "E:/app/logs" logger
>> hello1
>> End of example1 program!!!
>> End of example2 program!!
```

Видим, что в консоли вывелось и сообщение `hello1`, и все сообщения о завершении программ.

6. Скопируем из остановленного контейнера файл логов.

```sh
$ docker cp test:/app/logs/log.txt .
```

Проверим содержимое файла `log.txt`.

```sh
$ nl log.txt
>>     1	hello2
```

Проверка показала, что наша программа отработала корректно.

7. Проверяем наличие любых контейнеров, созданных на нашей локальной машине.

```sh
$ docker ps -a
>> CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                     PORTS     NAMES
>> 8a69981fdde5   logger    "/bin/sh -c './examp…"   6 minutes ago   Exited (0) 6 minutes ago             test
```

8. Удаляем контейнер для очистки пространства на диске.

```sh
$ docker rm test
```

Также проверим что у нас действительно не осталось никаких контейнеров.

```sh
$ docker ps -a
>> CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                     PORTS     NAMES
```
