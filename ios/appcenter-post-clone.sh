#!/usr/bin/env bash
#Place this script in project/ios/



echo "Uninstalling all CocoaPods versions"
sudo gem uninstall cocoapods --all --executables

COCOAPODS_VER=`sed -n -e 's/^COCOAPODS: \([0-9.]*\)/\1/p' Podfile.lock`

echo "Installing CocoaPods version $COCOAPODS_VER"
sudo gem install cocoapods -v $COCOAPODS_VER

# fail if any command fails
set -e
# debug log
set -x

cd ..
git clone -b beta https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor
flutter pub get

cd ios

pod setup

cd ..

echo "Installed flutter to `pwd`/flutter"

flutter build ios --release --no-codesign