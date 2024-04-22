#!/bin/bash

# Функция для обхода папок
traverse() {
    for file in "$1"/*; do
      for dir in ${file}/*; do
      # Проверяем, является ли текущая папка директорией
        if [ -d "$dir" ]; then
        # Заходим в папку src и скачиваем веса из файла weights_link.txt, если он там есть
          if [ -f "$dir/src/weights_link.txt" ]; then
            gdown --fuzzy $(cat ${dir}/src/weights_link.txt) -O ${dir}/src/weights.pth
          fi
        fi
      done
    done
}

# Вызываем функцию для обхода и поиска файла
traverse $GITHUB_WORKSPACE/pull-requests-data

cd $GITHUB_WORKSPACE/$ACTION_WORKSPACE/src

cp -r $GITHUB_WORKSPACE/pull-request-data . 

python3 main.py
