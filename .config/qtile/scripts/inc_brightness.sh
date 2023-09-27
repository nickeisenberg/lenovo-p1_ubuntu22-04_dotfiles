#!/bin/bash

inc_bright(){
    local val=$(xrandr --verbose | awk '/Bright/ {print $2}')
    local inv_val=.05
    local newval=$(echo "$val + $inv_val" | bc)
    
    echo $newval;

    xrandr --output eDP-1 --brightness $newval
}

inc_bright

