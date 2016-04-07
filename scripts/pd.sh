modprobe low-power-idle
echo 0 > /sys/devices/system/cpu/cpu3/online
echo 0 > /sys/devices/system/cpu/cpu2/online
echo 0 > /sys/devices/system/cpu/cpu1/online
echo suspend-m3 > /sys/class/low_power_idle/sleep/lp_mode
