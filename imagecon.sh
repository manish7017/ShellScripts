#!/bin/bash

echo "Enter the source directory containing images:"
read source_directory

echo "Enter the destination image format (e.g., jpg, png):"
read destination_format

if [ -d "$source_directory" ]; then
    echo "Processing images in '$source_directory'..."
    
    for image_file in "$source_directory"/*; do
        if [ -f "$image_file" ]; then
            filename=$(basename "$image_file")
            filename_noext="${filename%.*}"
            
            destination_file="$source_directory/$filename_noext.$destination_format"
            convert "$image_file" -resize 50% "$destination_file"
            
            if [ $? -eq 0 ]; then
                echo "Processed '$image_file' to '$destination_file'"
            else
                echo "Processing of '$image_file' failed."
            fi
        fi
    done
else
    echo "Source directory '$source_directory' does not exist."
fi
