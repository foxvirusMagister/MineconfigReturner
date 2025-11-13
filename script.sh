#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
fastfetch_conf="$HOME/.config/fastfetch/config.jsonc"
kitty_conf="$HOME/.config/kitty/kitty.conf"


obtheme=$(which obconf > /dev/zero; echo $?)
obthemeQt=$(which obconf-qt > /dev/zero; echo $?)
fastfetch=$(which fastfetch > /dev/zero; echo $?)
jbmNerd=$(fc-list | grep JetBrainsMonoNerd > /dev/zero; echo $?)
kitty=$(which kitty > /dev/zero; echo $?)


function copyff() {
	echo "Копируем файл конфигурации fastfetch в $fastfetch_conf"
	cp "$SCRIPT_DIR/fastfetch.conf" $fastfetch_conf
}

function copykt() {
	echo "Копируем файл конфигурации kitty в $kitty_conf"
	cp "$SCRIPT_DIR/fastfetch.conf" $fastfetch_conf
}

if test obtheme = 0;
then
	obconf --install Infetheme.obt
elif test obthemeQt = 0;
then
	obconf-qt --install Infetheme.obt
	echo "Тема установлена"
fi


if [[ -f "$kitty_conf" && $kitty = 0 && $jbmNerd = 0 ]];
then
	echo "Заменить файл конфигурации kitty?"
	read answ
	if [[ $answ = 'y' || $answ = 'yes' ]];
	then
		copykt
	elif [[ $answ = 'n' || $answ = 'no' ]];
	then
		echo "Копирование не будет выполнено"
	else
		echo "Неизвестный ответ"
	fi
elif [[ $kitty = 0 && $jbmNerd = 0 ]];
then
	copykt
else
	echo "kitty либо JetBrainsNerdFont не найден"
fi

if [[ -f "$fastfetch_conf" && $fastfetch = 0 && $jbmNerd = 0 ]];
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
elif [[ $fastfetch = 0 && $jbmNerd = 0 ]];
then
	copyff
else
	echo "fastfetch не найден либо Nerd шрифт не найден"
fi
exit 0
