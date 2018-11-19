#!/bin/bash
#
# Copyright (C) 2014 Wenva <lvyexuwenfa100@126.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e

SRC_FILE="$1"
DST_PATH="$2"

VERSION=1.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF
VERSION: $VERSION
USAGE:
    $0 srcfile dstpath

DESCRIPTION:
    This script aim to generate ios app icons easier and simply.

    srcfile - The source png image. Preferably above 1024x1024
    dstpath - The destination path where the icons generate to.

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 1024.png ~/123
EOF
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check param
if [ $# != 2 ];
then
    usage
    exit -1
fi

# Check dst path whether exist.
mkdir -p "$DST_PATH/mipmap-mdpi"
mkdir -p "$DST_PATH/mipmap-hdpi"
mkdir -p "$DST_PATH/mipmap-xhdpi"
mkdir -p "$DST_PATH/mipmap-xxhdpi"
mkdir -p "$DST_PATH/mipmap-xxxhdpi"

convert "$SRC_FILE" -resize 48x48 "$DST_PATH/mipmap-mdpi/ic_launcher.png"
convert "$SRC_FILE" -resize 72x72 "$DST_PATH/mipmap-hdpi/ic_launcher.png"
convert "$SRC_FILE" -resize 96x96 "$DST_PATH/mipmap-xhdpi/ic_launcher.png"
convert "$SRC_FILE" -resize 144x144 "$DST_PATH/mipmap-xxhdpi/ic_launcher.png"
convert "$SRC_FILE" -resize 192x192 "$DST_PATH/mipmap-xxxhdpi/ic_launcher.png"

convert "$SRC_FILE" -resize 48x48! \( +clone -threshold -1 -negate -fill white -draw "circle 24,24 24,0" \) -alpha off -compose copy_opacity -composite  "$DST_PATH/mipmap-mdpi/ic_launcher_round.png"
convert "$SRC_FILE" -resize 72x72! \( +clone -threshold -1 -negate -fill white -draw "circle 36,36 36,0" \) -alpha off -compose copy_opacity -composite "$DST_PATH/mipmap-hdpi/ic_launcher_round.png"
convert "$SRC_FILE" -resize 96x96! \( +clone -threshold -1 -negate -fill white -draw "circle 48,48 48,0" \) -alpha off -compose copy_opacity -composite "$DST_PATH/mipmap-xhdpi/ic_launcher_round.png"
convert "$SRC_FILE" -resize 144x144! \( +clone -threshold -1 -negate -fill white -draw "circle 72,72 72,0" \) -alpha off -compose copy_opacity -composite  "$DST_PATH/mipmap-xxhdpi/ic_launcher_round.png"
convert "$SRC_FILE" -resize 192x192! \( +clone -threshold -1 -negate -fill white -draw "circle 96,96 96,0" \) -alpha off -compose copy_opacity -composite  "$DST_PATH/mipmap-xxxhdpi/ic_launcher_round.png"

info 'Generate Done.'
