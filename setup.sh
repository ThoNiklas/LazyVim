#!/bin/bash

# Function to check if fd-find is installed.
check_fd_find() {
  if command -v fd >/dev/null 2>&1 || command -v fdfind >/dev/null 2>&1; then
    echo "fd-find is already installed."
  else
    echo "fd-find is not installed. Installing now..."
  fi
}

# Function to check if fzf is installed.
check_fzf() {
  if command -v fzf >/dev/null 2>&1; then
    echo "fzf is already installed."
  else
    echo "fzf is not installed. Installing now..."
  fi
}

# Function to install fd-find
install_fd_find() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # For Debian/Ubuntu
    if command -v apt >/dev/null 2>&1; then
      sudo apt update && sudo apt install -y fd-find

    # For Fedora
    elif command -v dnf >/dev/null 2>&1; then
      sudo dnf install -y fd-find

    # For Arch
    elif command -v pacman >/dev/null 2>&1; then
      sudo pacman -S --noconfirm fd

    else
      echo "Unsupported  linux distribution. Please install fd-find manually."
    fi

  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # For macOS
    if command -v brew >dev/null 2>&1; then
      brew install fd
    else
      echo "Homebrew is not installed. Please install Homenrew first."
    fi
  else
    echo "Unsupported OS. Please install fd-find manually."
  fi
}

# Function to install fzf
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # For Debian/Ubuntu
  if command -v apt >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y fzf

  # For Fedora
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y fzf

  # For Arch
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -S --noconfirm fzf

  else
    echo "Unsupported  linux distribution. Please install fd-find manually."
  fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
  # For macOS
  if command -v brew >dev/null 2>&1; then
    brew install fzf
  else
    echo "Homebrew is not installed. Please install Homenrew first."
  fi
else
  echo "Unsupported OS. Please install fd-find manually."
fi

check_fd_find
check_fzf
