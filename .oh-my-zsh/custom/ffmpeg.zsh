download_m3u8() {
    ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i $1 -c copy video.mp4
}
