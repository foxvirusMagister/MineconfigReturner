obBorders=$(which obconf &> /dev/null; echo $?)
obBordersQt=$(which obconf-qt &> /dev/null; echo $?)


function askUser(){
        echo -e "\nХотите ли вы установить тему openBox?"
        read answ
        if [[ $answ = 'y' || $answ = 'yes' ]]; then
                obconf --install Infetheme.obt
        elif [[ $answ = 'n' || $answ = 'no' ]]; then
                echo "Тема не будет установлена!"
        else
                echo "Неизвестный ответ попробуйте еще раз"
                askUser
        fi
}

function askUserQt(){
        echo "Хотите ли вы установить тему openBox?"
        read answ
        if [[ $answ = 'y' || $answ = 'yes' ]]; then
                obconf-qt --install Infetheme.obt
                echo "Тема установлена!"
        elif [[ $answ = 'n' || $answ = 'no' ]]; then
                echo "Тема не будет установлена!"
        else
                echo "Неизвестный ответ попробуйте еще раз"
                askUserQt
        fi
}

if test $obBorders = 0;
then
        askUser
elif test $obBordersQt = 0;
then
        echo -e "\nobconf gtk не существует, используем qt"
        askUserQt
else
        echo -e "\nobconf-qt как и obconf не существует, проверьте наличие любого из них!"
fi
