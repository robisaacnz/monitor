#!/bin/sh

echo 'Building Monitor.app...'

# Test build only.
# Release build needs assets copied to absolute path due to a Electron bug
# on macOS where relative paths inside app bundles are not defined.

nativefier --name "Monitor" \
    --fast-quit \
    --single-instance \
    --title-bar-style hiddenInset \
    --darwin-dark-mode-support \
    --disable-dev-tools \
    --disable-context-menu \
    --width 1280 \
    --height 720 \
    --max-width 1920 \
    --max-height 1080 \
    --min-width 852 \
    --min-height 480 \
    --icon ./app.icns \
    --browserwindow-options '{ "fullscreenable": true }' \
    file:///Applications/Monitor.app/Contents/Resources/app/index.html \
    ./

echo 'Build attempt complete. Launching...'

open ./Monitor-darwin-x64/Monitor.app
