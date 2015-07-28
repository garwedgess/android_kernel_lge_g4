emmc_size="`cat /sys/block/mmcblk0/size`"

TARGET_8GB_MODEL=16777216   # (8*1024*1024*1024)/512
TARGET_16GB_MODEL=33554432  # (16*1024*1024*1024)/512
TARGET_32GB_MODEL=67108864  # (32*1024*1024*1024)/512

if [ $emmc_size -lt $TARGET_8GB_MODEL ]; then
       setprop persist.sys.emmc_size 8G
       echo 8G model
elif [ $emmc_size -lt $TARGET_16GB_MODEL ]; then
       setprop persist.sys.emmc_size 16G
       echo 16G model
elif [ $emmc_size -lt $TARGET_32GB_MODEL ]; then
       setprop persist.sys.emmc_size 32G
       echo 32G model
else
       setprop persist.sys.emmc_size 64G
       echo 64G model
fi
