# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  license "Apache-2.0"
  # Some 1.10.0 installs recorded their keg as version "64", which Homebrew
  # compares as newer than any 1.x release and so would never be upgraded.
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.3/pup_1.10.3_Darwin_arm64.tar.gz"
      sha256 "bf700813d3db49eae31cb47b1a760c91a46f041c4947a0152e2bd20300e2b3cc"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.3/pup_1.10.3_Darwin_x86_64.tar.gz"
      sha256 "921e9dca0cb70e1851033263a647198b33e59b60db0172fea127e855a7fd8965"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.3/pup_1.10.3_Linux_arm64.tar.gz"
      sha256 "ab053f4b10306ad164e486bd337eee7f8a5ee3b78f5e909e14f734d4fa8f2562"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.3/pup_1.10.3_Linux_x86_64.tar.gz"
      sha256 "55be6afdfe6f93f558ab7bcb25985c74055c9955e9c87b26839d9ed44cff034a"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
