#!/bin/bash

# Read the filename from user input
echo "Enter the filename:"
read filename

# Check if the file exists
if [ -e "$filename" ]; then
    echo "File '$filename' exists."
    echo "Opening the file in the text editor..."
    nano "$filename"
else
    echo "File '$filename' does not exist."
    echo "Do you want to create it? (y/n)"
    read create_choice
    
    if [ "$create_choice" = "y" ]; then
        touch "$filename"
        echo "File '$filename' created."
        echo "Opening the file in the text editor..."
        nano "$filename"
    else
        echo "Exiting."
    fi
fi
