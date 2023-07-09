#!/bin/bash

# Check if yt-dlp is installed
if [ ! -f "yt-dlp" ]; then
  echo "yt-dlp is not installed. Installing yt-dlp."
  curl -LJO https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
  chmod +x "yt-dlp"
fi

# Check if aria2c is installed
if ! command -v aria2c &>/dev/null; then
  echo "aria2 is not installed. Installing aria2"
  sudo apt install -y aria2
fi

# Check if ffmpeg is installed
if [ ! -f "ffmpeg" ]; then
  echo "ffmpeg is not installed. Installing ffmpeg."
  sudo apt install -y ffmpeg
fi

# Check if yt-dlp is up to date
current_version=$(./yt-dlp --version)
latest_version=$(curl -s https://api.github.com/repos/yt-dlp/yt-dlp/releases/latest | grep 'tag_name' | cut -d '"' -f 4)

if [[ "$current_version" != "$latest_version" ]]; then
  echo "A newer version of yt-dlp is available. Updating..."
  rm "yt-dlp"
  curl -LJO https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
  chmod +x "yt-dlp"
  echo "yt-dlp has been updated to the latest version."
fi

# Prompt for playlist URL
read -p "Enter the playlist URL: " playlist_url

# Download the playlist
./yt-dlp -c -i -f 'bestvideo+bestaudio/best' --external-downloader aria2c --downloader-args "-c -s 16 -x 16 -k 1M -j 8" -o "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" "$playlist_url"
