#!/usr/bin/env bash

# ОШИБКА 1: Неэкранированная переменная (SC2086)
file=$1
[ -z $file ] && echo "No file"

# ОШИБКА 2: Использование ls для обработки (SC2045)
for f in $(ls *.txt); do
    echo $f
done

# ОШИБКА 3: Неиспользуемая переменная (SC2034)
unused_var="I am never used"

# ОШИБКА 4: Сравнение чисел как строк (SC2071)
if [ $# > 5 ]; then
    echo "Too many args"
fi

# ОШИБКА 5: Отсутствие проверки ошибок (SC2164)
cd /tmp
rm -rf something

# ОШИБКА 6: Неправильное использование echo с флагами (SC2028)
echo "Line 1\nLine 2"

# ОШИБКА 7: Переменная в одинарных кавычках (SC2016)
echo 'Current directory: $PWD'

# ОШИБКА 8: Проблема с пробелами в имени файла
cp $file /backup/

# ОШИБКА 9: Использование устаревшего синтаксиса (SC2006)
result=`date +%s`

# ОШИБКА 10: Неправильный if-else
if [ -f "$file" ]
then
    cat $file
else
    echo "File not found"
fi