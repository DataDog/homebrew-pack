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
      url "https://github.com/DataDog/pup/releases/download/v1.15.2/pup_1.15.2_Darwin_arm64.tar.gz"
      sha256 "6787a3d012f60fe3286efa0e798f12bfca0aed684f7f6e9587f88defda5fcc5e"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.15.2/pup_1.15.2_Darwin_x86_64.tar.gz"
      sha256 "1117cbecc2929c0b657ab360f43622138a8646e1774f2b40e2acda37240dc049"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.15.2/pup_1.15.2_Linux_arm64.tar.gz"
      sha256 "a7617eae91490a3b56cecde976da81c7137ea944310e44bbbcae89e92393dda9"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.15.2/pup_1.15.2_Linux_x86_64.tar.gz"
      sha256 "1e2d019afb8767bb548e9b4154d811f27936d18aa2d5d96a6e5549c0d6af3313"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
