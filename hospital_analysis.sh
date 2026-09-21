#!/bin/bash

water_audit() {
    echo "Running water usage audit..."

    average=$(grep "ICU_WATER_RESERVE" active_logs/water_usage_log.log | \
    awk -F' \\| ' '{sum += $3; count++} END {if (count > 0) print sum/count; else print 0}')

    printf "ICU Water Reserve Audit\n"
    printf "%s\n" "------------------------"
    printf "Average Usage: %.2f Liters/min\n" "$average"
}

process_vitals() {
    echo "Scanning for critical patient vitals..."

    > reports/critical_alerts.txt

    grep "CRITICAL" active_logs/heart_rate_log.log | \
    awk -F' \\| ' '{print $1, "|", $2, "|", $3}' >> reports/critical_alerts.txt

    grep "CRITICAL" active_logs/temperature_log.log | \
    awk -F' \\| ' '{print $1, "|", $2, "|", $3}' >> reports/critical_alerts.txt

    echo "Critical alerts saved to reports/critical_alerts.txt"
}

process_vitals
water_audit
