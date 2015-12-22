#!/system/bin/sh

target_operator=`getprop ro.build.target_operator`
case "$target_operator" in
    "ATT")
        default="charge_only"
        ;;
    "VZW")
        if [ -f "/system/usbautorun.iso" ];
        then
            echo 0 > /sys/class/android_usb/android0/f_cdrom_storage/lun/cdrom_usbmode
            default="cdrom_storage"
        else
            default="mtp"
        fi
        ;;
    *)
        default="mtp"
        ;;
esac

usb_config=`getprop persist.sys.usb.config`
case "$usb_config" in
    "boot") #factory status, select default
        setprop persist.sys.usb.config $default
    ;;
    "boot,adb") #factory status, select default
        setprop persist.sys.usb.config ${default},adb
    ;;
    *) ;; #USB persist config exists, do nothing
esac
