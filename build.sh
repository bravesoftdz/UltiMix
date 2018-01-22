#/bin/bash

if [[ -e /c/ultibo ]]
then
    WINDOWS=1
    ULTIBO=/c/ultibo/core/fpc/3.1.1
    ULTIBOBIN=$ULTIBO/bin/i386-win
    export PATH=/c/ultibo/core/qemu:$ULTIBOBIN:$PATH
elif [[ -e $HOME/ultibo ]]
then
    WINDOWS=0
    ULTIBO=$HOME/ultibo/core/fpc
    ULTIBOBIN=$ULTIBO/bin
    export PATH=$ULTIBOBIN:$PATH
else
    echo cannot find ultibo
    exit 1
fi

function checkexit {
    if [[ $1 != 0 ]]
    then
        cat errors.log
        exit 1
    fi
}

function compile {
    fpc -s -al -B -O2 -Tultibo -Parm -CpARMV7a -WpRPI3B -Fi$ULTIBO/source/rtl/ultibo/core @$ULTIBOBIN/RPI3.CFG *.lpr >& errors.log
    checkexit $?
}

compile

if [[ $WINDOWS == 1 ]]
then
    chmod u+x ppas.bat
    ./ppas.bat >& errors.log
    checkexit $?
else
    ./ppas.sh >& errors.log
    checkexit $?
fi
