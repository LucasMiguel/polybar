#!/usr/bin/env bash

# Pegando brilho
BRIGHTNESS=$(brightnessctl g)
MAX=$(brightnessctl m)
PERC=$(( 100 * BRIGHTNESS / MAX ))

# Ramp visual
RAMP=("󰃚 " "󰃛 " "󰃜 " "󰃝 " "󰃞 " "󰃟 " "󰃠 ")
INDEX=$(( PERC * (${#RAMP[@]} - 1) / 100 ))

if   [ "$PERC" -le 25 ]; then COLOR="#669bbc"
elif [ "$PERC" -le 60 ]; then COLOR="#F1FA8C"
else COLOR="#ffb703"; fi

# Mostrar
show() {
    echo "%{F$COLOR}$ICON ${RAMP[$INDEX]}"
}

# Comando para aumentar/diminuir
case $1 in
    up) brightnessctl s +5% >/dev/null ;;
    down) brightnessctl s 5%- >/dev/null ;;
    *) show ;;
esac

