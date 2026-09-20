#!/bin/bash
secure_data() {
	echo "Securing active_logs directory..."
	chmod 700 active_logs
	echo "Directory permissions"
	ls -l -d active_logs
	# 700 = owner has read/write/execute, group and others have no access
} 
