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
      url "https://github.com/DataDog/pup/releases/download/v1.10.5/pup_1.10.5_Darwin_arm64.tar.gz"
      sha256 "0c082f5f6e545ba5f5aca04eb048720f7c6c502006dede1b0c87c270cabb760a"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.5/pup_1.10.5_Darwin_x86_64.tar.gz"
      sha256 "006cb0184bdfccae1f1cadac323055084d3d4f5ba76f89691f6977b60dc586e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.5/pup_1.10.5_Linux_arm64.tar.gz"
      sha256 "6a75c50cfbec5c2beea4a2c766adf62299bff040041db8b46f3806687208c2d4"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.5/pup_1.10.5_Linux_x86_64.tar.gz"
      sha256 "f973dff8c7c638dd9c67b150f3b2ecd77a4a17ef4aebc1aaee3c2e2d438cb5b0"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
