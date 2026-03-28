# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.38.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.38.0/pup_0.38.0_Darwin_arm64.tar.gz"
      sha256 "29a392e2dd4be5732e55876bffd88e88da45cace27e1e088377050fd6aced293"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.38.0/pup_0.38.0_Darwin_x86_64.tar.gz"
      sha256 "1bbcaacc58436dbfb9644ed4ed84ede53bd947f0c11683a071ce20bce21a777a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.38.0/pup_0.38.0_Linux_arm64.tar.gz"
      sha256 "ae4fae406d14152e3f0f4b90e893cc350ac76c8ab72b87716a71b2cc346570fe"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.38.0/pup_0.38.0_Linux_x86_64.tar.gz"
      sha256 "f1af458ed0a435e315bb6bb8d108b67c99088e6719d448c41b97b56035dd9c4a"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
