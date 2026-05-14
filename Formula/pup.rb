# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.62.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.62.0/pup_0.62.0_Darwin_arm64.tar.gz"
      sha256 "155d109934c3dd8f7d364ad85a45b2c219d891f3bfa95a09ccfb61094e60fd1c"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.62.0/pup_0.62.0_Darwin_x86_64.tar.gz"
      sha256 "e79f2d2460209438e3aff2c1f1037389032e24a76a21a6489148ca570d36bf18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.62.0/pup_0.62.0_Linux_arm64.tar.gz"
      sha256 "6e54e5fdb73b32f695d6460d2332c165391b6db6a7e328d6d18e87c9b1e01f63"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.62.0/pup_0.62.0_Linux_x86_64.tar.gz"
      sha256 "3e4eb5c2c7af66012b114d28c5a1ddef631d05dbcfe927590e9cde233d36731a"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
