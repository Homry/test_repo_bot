#!/bin/bash

# # Функция для обхода папок
# traverse() {
#     for file in "$1"/*; do
#       for dir in ${file}/*; do
#       # Проверяем, является ли текущая папка директорией
#         if [ -d "$dir" ]; then
#         # Заходим в папку src и скачиваем веса из файла weights_link.txt, если он там есть
#           if [ -f "$dir/src/weights_link.txt" ]; then
#             gdown --fuzzy $(cat ${dir}/src/weights_link.txt) -O ${dir}/src/weights.pth
#             echo "${dir}"
#           fi
#         fi
#       done
#     done
# }
# traverse() {
#     for file in "$1"/*; do
#       echo ${file}
#       for dir in ${file}/*; do
#         echo ${dir}
#       # Проверяем, является ли текущая папка директорией
#         if [ -d "$dir" ]; then
#           echo "hi from if"
#         # Заходим в папку src и скачиваем веса из файла weights_link.txt, если он там есть
#           if [ -f "$dir/src/weights_link.txt" ]; then
#             gdown --fuzzy $(cat ${dir}/src/weights_link.txt) -O ${dir}/src/weights.pth
#           fi
#         fi
#       done
#     done
# }
traverse() {
    for file in `find "$1" -type d -name "*"`; do
      echo ${file}
      for dir in `find "$file" -type d -name "*"`; do
        echo ${dir}
      # Проверяем, является ли текущая папка директорией
        if [ -d "$dir" ]; then
          echo "hi from if"
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

mkdir $GITHUB_WORKSPACE/$ACTION_WORKSPACE/src/action
mkdir $GITHUB_WORKSPACE/$ACTION_WORKSPACE/src/action/datasets
unzip /lab1_dataset.zip -d $GITHUB_WORKSPACE/$ACTION_WORKSPACE/src/action/datasets > trash_tmp

cd $GITHUB_WORKSPACE/$ACTION_WORKSPACE/src

cp -r $GITHUB_WORKSPACE/pull-request-data . 

# python3 main.py
tail -f /dev/null
