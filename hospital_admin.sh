#!/bin/bash
#Initializing system environment
initialize_system() {
	echo "Initializing hospital system..."

	for dir in active_logs archived_logs reports; do
		if [ -d "$dir" ]; then
			echo "$dir directory already exists."
		else
			echo "Creating $dir directory..."
			mkdir -p "$dir"
		fi
	done

	echo "System initialization complete."
}

secure_data() {
	echo "Securing active_logs directory..."
	chmod 700 active_logs
	echo "Directory permissions"
	ls -l -d active_logs
	# 700 = owner has read/write/execute, group and others have no access
} 
