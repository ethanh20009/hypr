monitorid=$(xrandr | grep 2560x1440+ | awk '{print $1}')
xrandr --output "$monitorid" --primary
