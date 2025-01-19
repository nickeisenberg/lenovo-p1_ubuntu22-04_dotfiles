#!/bin/bash

take_screenshot() {
    local mode=$1 # The mode of the screenshot: full, select, or window
    local filename="$HOME/pictures/Screenshots/screen_$(date +%Y-%m-%d-%T).png"

    case $mode in
        full)
            maim -u "$filename"
            ;;
        select)
            maim -s "$filename"
            ;;
        window)
            # Assuming you want to capture a specific window by clicking or ID
            # -i option requires a window ID. Use `xdotool` to select window with mouse.
            local window_id=$(xdotool selectwindow)
            maim -u -i $window_id "$filename"
            ;;
        *)
            echo "Invalid mode. Usage: $0 {full|select|window}"
            exit 1
            ;;
    esac

    echo "Screenshot saved as $filename"
}

take_screenshot "$1"
