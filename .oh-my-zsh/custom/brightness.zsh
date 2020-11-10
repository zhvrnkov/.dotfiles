brightness() {
    echo $1 | sudo tee /sys/class/backlight/intel_backlight/brightness
}

brightnessmin() {
    brightness 300
}

brightnessmedium() {
    brightness 1000
}

brightnessmax() {
    brightness 2000
}
