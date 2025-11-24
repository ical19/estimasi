#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y unzip wget

ANDROID_SDK_ROOT=$HOME/android-sdk
mkdir -p $ANDROID_SDK_ROOT/cmdline-tools

# Download Android Command Line Tools
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O tools.zip
unzip tools.zip -d $ANDROID_SDK_ROOT/cmdline-tools
mv $ANDROID_SDK_ROOT/cmdline-tools/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/latest

# Add to PATH
echo "export ANDROID_SDK_ROOT=$ANDROID_SDK_ROOT" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools" >> ~/.bashrc

source ~/.bashrc

# Install platform tools and build tools
yes | sdkmanager --licenses
sdkmanager "platform-tools" "build-tools;34.0.0" "platforms;android-34"
