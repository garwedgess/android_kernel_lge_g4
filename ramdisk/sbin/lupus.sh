#!/system/bin/sh

BB=/sbin/busybox

$BB mount -t rootfs -o remount,rw rootfs

sync

# setup init.d if not exist
if [ ! -e /system/etc/init.d ]; then
	mkdir /system/etc/init.d
	chown -R root.root /system/etc/init.d
	chmod -R 755 /system/etc/init.d
fi;

#inject busybox if not present
if [ ! -f /system/xbin/busybox ]; then
	cp /sbin/busybox /system/xbin/
	cd /system/xbin
	chmod 755 busybox
	./busybox --install -s /system/xbin
fi;

FILES=/system/etc/init.d/*

for f in $FILES
	do
		$f
	done


	# Google Services battery drain fixer by Alcolawl@xda
	# http://forum.xda-developers.com/google-nexus-5/general/script-google-play-services-battery-t3059585/post59563859
	pm enable com.google.android.gms/.update.SystemUpdateActivity
	pm enable com.google.android.gms/.update.SystemUpdateService
	pm enable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver
	pm enable com.google.android.gms/.update.SystemUpdateService$Receiver
	pm enable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver
	pm enable com.google.android.gsf/.update.SystemUpdateActivity
	pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity
	pm enable com.google.android.gsf/.update.SystemUpdateService
	pm enable com.google.android.gsf/.update.SystemUpdateService$Receiver
	pm enable com.google.android.gsf/.update.SystemUpdateService$SecretCodeReceiver

$BB mount -t rootfs -o remount,ro rootfs
$BB mount -o remount,rw /data


