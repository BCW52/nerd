#!/bin/bash

# Define the installation directory
FLUTTER_INSTALL_DIR="$HOME"

# URL for the Flutter SDK tar.xz file
FLUTTER_SDK_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.5.2-stable.tar.xz"

# Install Flutter
if ! command -v flutter &> /dev/null; then
  echo "Flutter not found. Installing..."


  # Download and extract Flutter
  cd "$FLUTTER_INSTALL_DIR/flutter"
  wget "$FLUTTER_SDK_URL"
  tar xf "flutter_linux_2.5.2-stable.tar.xz"
  export PATH="$PATH:`pwd`/flutter/bin"
fi