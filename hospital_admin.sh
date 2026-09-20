#!/bin/bash
secure_data() {
	echo "Securing active_logs directory..."
	chmod 700 active_logs
	echo "Permissions updated. New permissions for active_logs:"
	ls -l -d active_logs
} 
