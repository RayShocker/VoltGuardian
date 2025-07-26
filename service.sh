#!/system/bin/sh

# ===== KONFIGURASI UTAMA =====
LOG_FILE="/data/local/tmp/volt-guardian-debug.log"
MARGIN_PATH="/sys/power/percent_margin"
INTERVAL=10  # detik

log() {
    echo "[$(date '+%H:%M:%S')] $1" >> "$LOG_FILE"
    [ $(stat -c%s "$LOG_FILE") -gt 262144 ] && tail -n 100 "$LOG_FILE" > "$LOG_FILE.tmp" && mv "$LOG_FILE.tmp" "$LOG_FILE"
}

log "=== Memulai Performance Mode (Normal) ==="
log "Perangkat: $(getprop ro.product.model) | ROM: $(getprop ro.build.display.id)"

# ===== ATUR GOVERNOR, FREKUENSI & I/O SCHEDULER =====
lock_normal_freq() {
    echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
    echo "schedutil" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor

    echo 1794000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 2314000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    echo 2704000 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
    echo 702000  > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
}

# ===== SET UNDERVOLT MARGIN MODE NORMAL =====
apply_normal_undervolt() {
    echo -1 > $MARGIN_PATH/big_margin_percent
    echo -1 > $MARGIN_PATH/mid_margin_percent
    echo -1 > $MARGIN_PATH/g3d_margin_percent
    echo 0  > $MARGIN_PATH/mif_margin_percent
    echo -2 > $MARGIN_PATH/lit_margin_percent
    echo -2 > $MARGIN_PATH/npu_margin_percent
    echo -2 > $MARGIN_PATH/mfc_margin_percent
    echo 0  > $MARGIN_PATH/fsys0_margin_percent
    echo -2 > $MARGIN_PATH/iva_margin_percent
    echo -2 > $MARGIN_PATH/score_margin_percent
}

# ===== EKSEKUSI AWAL =====
lock_normal_freq
apply_normal_undervolt
log "--- Applied Performance Mode (Normal) ---"

# ===== LOOP UNTUK MENJAGA KONDISI =====
while true; do
    lock_normal_freq
    apply_normal_undervolt
    sleep $INTERVAL
done===
while true; do
    lock_normal_freq
    apply_normal_undervolt
    sleep $INTERVAL
donedo
    lock_normal_freq
    apply_normal_undervolt
    sleep $INTERVAL
done===
while true; do
    lock_normal_freq
    apply_normal_undervolt
    sleep $INTERVAL
done