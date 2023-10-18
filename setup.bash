#!/bin/bash

function install_packages() {
  apk add --no-cache \
    build-base \
    protoc \
    curl \
    nodejs \
    npm \
    wireguard-tools
}

function install_rust() {
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source /root/.profile
}

function install_kubernetes() {
  curl -LO https://dl.k8s.io/release/v1.28.2/bin/linux/amd64/kubectl
  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  rm kubectl
}

function main() {
  install_packages
  install_rust
  install_kubernetes
}

main
