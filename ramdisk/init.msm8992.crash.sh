#!/system/bin/sh

enable=`getprop persist.service.crash.enable`

PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

case $enable in
    "1")
        echo 1 > /sys/module/msm_poweroff/parameters/download_mode
        echo 55 > /sys/module/msm_rtb/parameters/filter
        echo 1 > /sys/kernel/debug/tracing/tracing_on
        # schedular
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_cpu_hotplug/enable
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_migrate_task/enable
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_switch/enable
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_wakeup/enable
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_wakeup_new/enable
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_stat_runtime/enable
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_stat_blockedenable
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_stat_iowait/enable
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_stat_sleep/enable
        echo 1 > /sys/kernel/debug/tracing/events/sched/sched_stat_wait/enable
        # workqueue
        echo 1 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_start/enable
        echo 1 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_end/enable
        # clock
        echo 1 > /sys/kernel/debug/tracing/events/power/clock_set_rate/enable
        # regulator
        echo 1 > /sys/kernel/debug/tracing/events/regulator/enable
        # power
        echo 1 > /sys/kernel/debug/tracing/events/msm_low_power/enable
        # thermal
        echo 1 > /sys/kernel/debug/tracing/events/thermal/thermal_pre_core_offline/enable
        echo 1 > /sys/kernel/debug/tracing/events/thermal/thermal_post_core_offline/enable
        echo 1 > /sys/kernel/debug/tracing/events/thermal/thermal_pre_core_online/enable
        echo 1 > /sys/kernel/debug/tracing/events/thermal/thermal_post_core_online/enable
        # irq
        echo 1 > /sys/kernel/debug/tracing/events/irq/irq_handler_entry/enable
        # size
        echo 4096 > /sys/kernel/debug/tracing/buffer_size_kb
        ;;
    "0")
        echo 0 > /sys/module/msm_poweroff/parameters/download_mode
        echo 0 > /sys/module/msm_rtb/parameters/filter
        echo 0 > /sys/kernel/debug/tracing/tracing_on
        # schedular
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_cpu_hotplug/enable
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_migrate_task/enable
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_switch/enable
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_wakeup/enable
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_wakeup_new/enable
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_stat_runtime/enable
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_stat_blockedenable
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_stat_iowait/enable
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_stat_sleep/enable
        echo 0 > /sys/kernel/debug/tracing/events/sched/sched_stat_wait/enable
        # workqueue
        echo 0 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_start/enable
        echo 0 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_end/enable
        # clock
        echo 0 > /sys/kernel/debug/tracing/events/power/clock_set_rate/enable
        # regulator
        echo 0 > /sys/kernel/debug/tracing/events/regulator/enable
        # power
        echo 0 > /sys/kernel/debug/tracing/events/msm_low_power/enable
        # thermal
        echo 0 > /sys/kernel/debug/tracing/events/thermal/thermal_pre_core_offline/enable
        echo 0 > /sys/kernel/debug/tracing/events/thermal/thermal_post_core_offline/enable
        echo 0 > /sys/kernel/debug/tracing/events/thermal/thermal_pre_core_online/enable
        echo 0 > /sys/kernel/debug/tracing/events/thermal/thermal_post_core_online/enable
        # irq
        echo 0 > /sys/kernel/debug/tracing/events/irq/irq_handler_entry/enable
        # size
        echo 0 > /sys/kernel/debug/tracing/buffer_size_kb
        # free buffer
        echo > /sys/kernel/debug/tracing/free_buffer
        ;;
esac
