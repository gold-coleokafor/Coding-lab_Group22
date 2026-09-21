#!/bin/bash

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
