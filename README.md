# APP ICONS Generator

### Description
Set of shell scripts which aim to generate iOS, macOS, Android APP icons easier and simply.

![image](https://github.com/smallmuou/ios-icon-generator/blob/master/ios-icon-generator.gif)

<pre>
VERSION: 1.0.1
USAGE:
    ./ios-icon-generator.sh srcfile dstpath
    ./android-icon-generator.sh srcfile dstpath
    ./macos-icon-generator.sh srcfile dstpath

DESCRIPTION:
    This script aim to generate ios app icons easier and simply.

    srcfile - The source png image. Preferably above 1024x1024
    dstpath - The destination path where the icons generate to.

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

AUTHOR:
    Andrey A. Ugolnik <andrey@ugolnik.info>
    Pawpaw<lvyexuwenfa100@126.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    ./ios-icon-generator.sh 1024.png ~/123
</pre>

### Usage
1. Install ImageMagick

    Before you run this script, please check whether you had install ImageMagick. If you don't have install. Follow this:

```bash
sudo brew install ImageMagick
```

2. Clone And Chmod

```bash
git clone https://github.com/andreyugolnik/apps-icon-generator.git
cd apps-icon-generator
chmod 777 *.sh
```

3. Run

```bash
$ ./ios-icon-generator.sh ~/Downloads/1024.png ~/output
[INFO] Generate iTunesArtwork.png ...
[INFO] Generate iTunesArtwork@2x.png ...
[INFO] Generate Icon-Small.png ...
[INFO] Generate Icon-Small@2x.png ...
[INFO] Generate Icon-Small@3x.png ...
[INFO] Generate Icon-Small-40.png ...
[INFO] Generate Icon-Small-40@2x.png ...
[INFO] Generate Icon-Small-40@3x.png ...
[INFO] Generate Icon-60.png ...
[INFO] Generate Icon-60@2x.png ...
[INFO] Generate Icon-60@3x.png ...
[INFO] Generate Icon-76.png ...
[INFO] Generate Icon-76@2x.png ...
[INFO] Generate Icon.png ...
[INFO] Generate Icon@2x.png ...
[INFO] Generate Icon-72.png ...
[INFO] Generate Icon-72@2x.png ...
[INFO] Generate Icon-Small-50.png ...
[INFO] Generate Icon-Small-50@2x.png ...
[INFO] Generate Done.
```

PS: You can find out the icons in ~/output directory.

### Navigation bar items
There is also another shell script `ios-navbar-icon-generator.sh` to generate navigation bar icons, that works in the same way.

### Generic images
With the script `os-custom-icon-generator.sh` you can generate a set of three images to use in your app (myimg.png, myimg@2.png, myimg@3.png).

Use it in this way `./ios-custom-icon-generator.sh icon-big.png ~/asset_dir 100`. The third parameter is the final base size of the image: using 100, your output image.png will be 100x100 px, image@2.png 200x200 and image@3.png 300x300.
`

### Refer
* [App Icons on iPad and iPhone](https://developer.apple.com/library/ios/qa/qa1686/_index.html)
* [iOS Human Interface Guidelines](https://developer.apple.com/library/prerelease/ios/documentation/UserExperience/Conceptual/MobileHIG/IconMatrix.html#//apple_ref/doc/uid/TP40006556-CH27-SW1)

### History
* 1.0.1
    * Android and macOS generators added.
* 1.0.0
    * Generate all size icons for iPhone and iPad.

### License
This script follow MIT license.

### Contact
If you have any question with using it, you can email to me. My email is: andrey@ugolnik.info
