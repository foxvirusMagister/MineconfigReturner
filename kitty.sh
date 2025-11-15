if test ! -v $jbmNerd;
then
    jbmNerd=$(fc-list | grep JetBrainsMonoNerd > /dev/zero; echo $?)
fi
kitty_conf="$HOME/.config/kitty/kitty.conf"
kitty=$(which kitty > /dev/zero; echo $?)


function copykt() {
        echo "Копируем файл конфигурации kitty в $kitty_conf"
        cp "./fastfetch.conf" $fastfetch_conf
}

if [[ -f "$kitty_conf" && $kitty = 0 && $jbmNerd = 0 ]];
then
    echo -e "\nЗаменить файл конфигурации kitty?"
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
    echo -e "\nСоздать файл конфигурации kitty?"
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
else
        echo "kitty либо JetBrainsNerdFont не найден"
fi
