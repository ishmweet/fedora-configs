#!/usr/bin/env bash

set -e

echo "=== Updating System ==="
sudo dnf upgrade --refresh -y

echo "=== RPM Fusion ==="
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "=== Development Tools ==="
sudo dnf install -y \
  git \
  gh \
  unzip \
  curl \
  wget \
  pipx \
  kitty \
  tmux \
  vim \
  neovim \
  gcc \
  gcc-c++ \
  ripgrep \
  fd-find \
  make \
  kvantum \
  pkgconf-pkg-config

echo "=== Tauri Dependencies ==="
sudo dnf install -y \
  webkit2gtk4.1-devel \
  openssl-devel \
  gtk3-devel \
  glib2-devel \
  librsvg2-devel \
  libayatana-appindicator-gtk3-devel \
  dpkg \
  rpm-build

echo "=== Media Tools ==="
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing || true
sudo dnf install -y \
  ffmpeg \
  mpv

echo "=== Fonts ==="
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts || exit
wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
cd

echo "=== yt-dlp ==="
sudo mkdir -p /usr/local/bin
sudo wget -O /usr/local/bin/yt-dlp \
  https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

echo "=== Terminal Utilities ==="
sudo dnf install -y \
  fzf \
  jq \
  bat \
  fastfetch \
  cava \
  htop \
  btop

echo "=== ytfzf ==="
if [ ! -d /tmp/ytfzf ]; then
  git clone https://github.com/pystardust/ytfzf.git /tmp/ytfzf
else
  git -C /tmp/ytfzf pull
fi
cd /tmp/ytfzf
sudo make install doc
cd "$CURRENT_DIR"

echo "=== GitHub repos ==="
git clone https://github.com/ishmweet/veluna
git clone https://github.com/ishmweet/networking-from-scratch
git clone https://github.com/ishmweet/fedora-configs
git clone https://github.com/ishmweet/bash-scripting-YSAP
git clone https://github.com/ishmweet/python-notes

echo ""
echo "=================================="
echo "Setup Complete"
echo "=================================="
echo ""
echo "=== Next: ==="
echo "--> Install Rust:"
echo "    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
echo ""
echo "--> Install Brave Origin"
echo "    curl -fsS https://dl.brave.com/install.sh | FLAVOR=origin sh"
echo ""
echo "--> Restore .config files."
echo ""
echo "--> Install Discord, Node.js"
echo ""
echo "Done."
