# Gorizont.DbLib
Altium библиотека электронных компонентов для Горизонта и остальных
## Что делать до git clone
1. Скачать и установить [sqlite-tools](https://www.sqlite.org/download.html)
2. Скачать и установить [ODBC-драйвер для sqlite](http://www.ch-werner.de/sqliteodbc/)
3. Создать переменную окружения SQLITE3_PATH, где указать путь к программе sqlite3.exe
## Что делать после git clone
1. Дабл-клик на `_import.cmd`
2. В Altium Designer, в Preferences -> Data Manadgement -> Installed Libraries установить библиотеку `gorizont.DbLib`, созданную в п.1
## Что делать после git pull
1. Дабл-клик на `_import.cmd`
## Что делать перед git push
1. Дабл-клик на `_export.cmd`
2. Дабл-клик на `_clean.cmd`
