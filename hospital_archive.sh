#!/bin/bash 

archiving_files() {
        echo "Starting log archiving"
        timestamp=$(date +"%Y%m%d_%H%M")

        for file in active_logs/*; do
                filename=$(basename "$file") #taking only the file without the path
                nameonly="${filename%.*}" #takes the filename and extract only the name and leaves the extension
                extensiononly="${filename##*.}" #takes only the extension and removes the filename

                mv "$file" "archived_logs/${nameonly}_${timestamp}.${extensiononly}"
                echo "Move completed"
                touch "active_logs/$filename"
                echo "New file created"
        done

        echo "Archiving process complete"
}

archiving_files
