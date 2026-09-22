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
