#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
fastfetch_conf="$HOME/.config/fastfetch/config.jsonc"
fastfetch=false
obtheme=false
qt=false



function copyff() {
	echo "Копируем файл конфигурации fastfetch в $fastfetch_conf"
	cp "$SCRIPT_DIR/fastfetch.conf" $fastfetch_conf
}


if [[ $(which fastfetch > /dev/null 2>&1) || $(ls /usr/share/fonts/TTF | grep Nerd) ]];
then
	echo "fastfetch существует"
	fastfetch=true
fi
if [[ $(which obtheme > /dev/null 2>&1) ]];
then
	echo "obtheme существует"
	obtheme=true
elif [[ $(which obtheme-qt > /dev/null 2>&1) ]]
then
	echo "obtheme-qt существует"
	obtheme=true
	qt=true
fi
if test obtheme;
then
	if test qt;
	then
		obconf-qt --install Infetheme.obt
		echo "Тема установлена"
	else
		obconf --install Infetheme.obt
	fi
fi





if [[ -f "$fastfetch_conf" && $fastfetch = true ]];
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
elif test $fastfetch = true;
then
	copyff
else
	echo "fastfetch не найден либо Nerd шрифт не найден"
fi
exit 0
