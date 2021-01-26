# ─┐ ┬┌─┐┌┐┌┌─┐┌┐ ┬ ┬┌┬┐┌─┐ ─┐ ┬┬ ┬┌─┐
# ┌┴┬┘├┤ ││││ │├┴┐└┬┘ │ ├┤  ┌┴┬┘└┬┘┌─┘
# ┴ └─└─┘┘└┘└─┘└─┘ ┴  ┴ └─┘o┴ └─ ┴ └─┘
# Author:  SENEX @ XENOBYTE.XYZ
# License: MIT License
# Website: https://xenobyte.xyz/projects/?nav=dotfiles

# Makes a 4chan compliant webm
chines#!/bin/bash
file_path="$1"
file_dest="$2"
video_format="mp4"
output_format="webm"
echo "---------------------------"
echo "MP4 to convert: $file_path"
echo "WEBM: $file_dest"
echo "---------------------------"
if [ ! -f "$file_path" ]; then
    echo "Source file doesn't exist. (It must have an .mp4 extension)."
    exit -1
fi

if [ -f "$file_dest" ]; then
    echo "Destination file already axists."
    exit -2
fi

filename=$(basename "$file_path")
extension="${filename##*.}"
filename="${filename%.*}"

output_filename=$(basename "$file_dest")
output_extension="${output_filename##*.}"

if [ "$output_extension" != "$output_format" ]; then
    echo "Invalid destination."
    exit -3
fi

# echo $filename
# echo $extension
# echo $filename

# echo $output_filename
# echo $output_extension

# Equality Comparison
if [ "$extension" == "$video_format" ]; then
    ffmpeg -i "$file_path" -c:v libvpx -b:v 1M -c:a libvorbis "$file_dest"
else
    echo "Source file must have a .mp4 extension!"
fi
