#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
fastfetch_conf="$HOME/.config/fastfetch/config.jsonc"
fastfetch=0


function copyff() {
	echo "Копируем файл конфигурации fastfetch в $fastfetch_conf"
	cp "$SCRIPT_DIR/fastfetch.conf" $fastfetch_conf
}


if [[ $(which fastfetch > /dev/null 2>&1) || $(ls /usr/share/fonts/TTF | grep Nerd) ]];
then
	echo "fastfetch существует"
	fastfetch=1
fi


if [[ -f "$fastfetch_conf" && $fastfetch = 1 ]];
then
	echo "Заменить файл конфигурации fastfetch?"
	read answ
	if [[ $answ = 'y' || $answ = 'yes' ]];
	then
		copyff
	elif [[ $answ = 'n' || $answ = 'no' ]];
	then
		echo "Копирование не будет выполнено"
	else
		echo "Неизвестная команда"
	fi
elif test $fastfetch = 1;
then
	copyff
else
	echo "fastfetch не найден либо Nerd шрифт не найден"
fi
exit 0
