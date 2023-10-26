#!/bin/bash

# Define the installation directory
FLUTTER_INSTALL_DIR="$HOME"

# URL for the Flutter SDK tar.xz file
FLUTTER_SDK_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.5.2-stable.tar.xz"

# Install Flutter
if ! command -v flutter &> /dev/null; then
  echo "Flutter not found. Installing..."


  # Download and extract Flutter
  cd "$FLUTTER_INSTALL_DIR"
  wget "$FLUTTER_SDK_URL"
  tar xf "flutter_linux_2.5.2-stable.tar.xz"

  # Add Flutter to the PATH for this session
  export PATH="$PATH:`pwd`/flutter/bin"

  echo "Flutter installation completed."
else
  echo "Flutter is already installed."
fi

# Check if Flutter is in the PATH for all future sessions
if ! grep -q "flutter/bin" "$HOME/.bashrc"; then
  echo 'export PATH="$PATH:$HOME/flutter/bin"' >> "$HOME/.bashrc"

  echo "PATH updated for all future sessions."
fi

# Print installation instructions
echo "Please review the Flutter installation instructions at:"
echo "https://flutter.dev/docs/get-started/install/linux"