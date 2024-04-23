#!/bin/sh

SRC_ICON="$1"
SRC_BANNER="$2"
DST_PATH="$3"

VERSION=0.0.1

info() {
	local green="\033[1;32m"
	local normal="\033[0m"
	echo "[${green}INFO${normal}] $1"
}

error() {
	local red="\033[1;31m"
	local normal="\033[0m"
	echo "[${red}ERROR${normal}] $1"
}

usage() {
	cat <<EOF
VERSION: $VERSION
USAGE:
    $0 SourceIcon SourceBanner DestPath

DESCRIPTION:
    This script aim to generate Android TV app icons easier and simply.

    srcfile - The source png image. Preferably above 1024x1024
    dstpath - The destination path where the icons generate to.

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

EXAMPLE:
    $0 Banner.png Icon.png Output/
EOF
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || {
	error >&2 "The ImageMagick is not installed. Please use brew to install it first."
	exit -1
}

# Check param
if [ $# != 3 ]; then
	usage
	exit -1
fi

makeIconTV() {
	LOUTPATH="$DST_PATH/$1"
	LSIZE="$2"

	# make destination path
	mkdir -p "$LOUTPATH"

	# make rect icon
	convert "$SRC_ICON" -resize $LSIZE! "$LOUTPATH/ic_launcher.png"
}

makeIconTV "mipmap-mdpi" "80x80"
makeIconTV "mipmap-hdpi" "120x120"
makeIconTV "mipmap-xhdpi" "160x160"
makeIconTV "mipmap-xxhdpi" "240x240"
makeIconTV "mipmap-xxxhdpi" "320x320"
info 'Android TV icons ready.'

makeBannerTV() {
	LOUTPATH="$DST_PATH/$1"
	LSIZE="$2"

	# make destination path
	mkdir -p "$LOUTPATH"

	# make rect icon
	convert "$SRC_BANNER" -resize $LSIZE! "$LOUTPATH/ic_banner.png"
}

makeBannerTV "mipmap-mdpi" "160x90"
makeBannerTV "mipmap-hdpi" "240x135"
makeBannerTV "mipmap-xhdpi" "320x180"
makeBannerTV "mipmap-xxhdpi" "480x270"
makeBannerTV "mipmap-xxxhdpi" "640x360"
info 'Android TV banners ready.'

makeIcon() {
	LOUTPATH="$DST_PATH/$1"
	LSIZE="$2"

	# make destination path
	mkdir -p "$LOUTPATH"

	# make rect icon
	convert "$SRC_ICON" -resize $LSIZE! "$LOUTPATH/ic_icon.png"

	# make rounded icon
	magick "$LOUTPATH/ic_icon.png" \( +clone -threshold 101% -fill white -draw 'circle %[fx:int(w/2)],%[fx:int(h/2)] %[fx:int(w/2)],1' \) -channel-fx '| gray=>alpha' "$LOUTPATH/ic_icon_round.png"
}

makeIcon "mipmap-mdpi" "48x48"
makeIcon "mipmap-hdpi" "72x72"
makeIcon "mipmap-xhdpi" "96x96"
makeIcon "mipmap-xxhdpi" "144x144"
makeIcon "mipmap-xxxhdpi" "192x192"
info 'Android icons ready.'
