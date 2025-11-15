#!/bin/bash

jbmNerd=$(fc-list | grep JetBrainsMonoNerd > /dev/zero; echo $?)

source fastfetch.sh
source kitty.sh
source obborders.sh

exit 0
