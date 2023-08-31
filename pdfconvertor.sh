#!/bin/bash

# requirements to convert file into pdf are: 'enscript' and 'ps2pdf' utilities on your system

echo "Enter the directory containing text files:"
read text_files_directory

if [ -d "$text_files_directory" ]; then
    echo "Processing text files in '$text_files_directory'..."
    
    # convert text files to PDFs
    echo "Do you want to convert text files to PDFs? (y/n)"
    read convert_choice
    
    for file in "$text_files_directory"/*.txt; do
        if [ -f "$file" ]; then
            word_count=$(wc -w < "$file")
            line_count=$(wc -l < "$file")
            
            echo "File: $file"
            echo "Word Count: $word_count"
            echo "Line Count: $line_count"
            echo "--------------------"
            
            # Convert the text file
            if [ "$convert_choice" = "y" ]; then
                pdf_filename="${file%.txt}.pdf"
                enscript -B -o - "$file" | ps2pdf - "$pdf_filename"
                echo "File '$file' converted to '$pdf_filename'"
            fi
        fi
    done
else
    echo "Directory '$text_files_directory' does not exist."
fi
