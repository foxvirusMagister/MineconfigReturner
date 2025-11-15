fastfetch_conf="$HOME/.config/fastfetch/config.jsonc"
fastfetch=$(which fastfetch > /dev/zero; echo $?)
if test ! -v $jbmNerd;
then
    jbmNerd=$(fc-list | grep JetBrainsMonoNerd > /dev/zero; echo $?)
fi

function copyff() {
        echo "Копируем файл конфигурации fastfetch в $fastfetch_conf"
        cp "./fastfetch.conf" $fastfetch_conf
}

if [[ -f "$fastfetch_conf" && $fastfetch = 0 && $jbmNerd = 0 ]];
then
    echo -e "\nЗаменить файл конфигурации fastfetch?"
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
    echo -e "\nСоздать файл конфигурации fastfetch?"
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
else
        echo "fastfetch не найден либо Nerd шрифт не найден"
fi
