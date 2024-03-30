#!/bin/bash

temp_dir=$(mktemp -d)
echo "Temporary directory created: $temp_dir"

wordpress_url="https://wordpress.org/latest.tar.gz"
wordpress_file="$temp_dir/latest.tar.gz"

echo "Downloading the latest version of WordPress from $wordpress_url ..."
curl -sSL "$wordpress_url" -o "$wordpress_file"

tar -xf "$wordpress_file" -C "$temp_dir"

html_dir="html"

if [ -d "$html_dir" ]; then
    echo "Deleting the content of $html_dir ..."
    rm -rf "${html_dir:?}"/*
else
    echo "Creating directory $html_dir ..."
    mkdir "$html_dir"
fi

echo "Moving WordPress content to $html_dir ..."
mv "$temp_dir/wordpress"/* "$html_dir"

echo "Deleting the temporary directory $temp_dir ..."
rm -rf "$temp_dir"

