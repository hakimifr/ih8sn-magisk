#!/system/bin/sh
MODDIR=${0%/*}

chmod 0755 $MODDIR/system/bin/*
chmod 0644 $MODDIR/system/etc/*
chcon -R u:object_r:system_file:s0 $MODDIR/system/etc
chcon -R u:object_r:system_file:s0 $MODDIR/system/bin

ih8sn init

until [ "$(getprop sys.boot_completed)" = "1" ]; do
	: # Wait for prop
done

ih8sn boot_completed

# DenyList
magisk --denylist enable
magisk --denylist add com.google.android.gms
magisk --denylist add com.google.android.gms com.google.android.gms.unstable
