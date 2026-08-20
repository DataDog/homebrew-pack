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
      url "https://github.com/DataDog/pup/releases/download/v1.12.1/pup_1.12.1_Darwin_arm64.tar.gz"
      sha256 "f9223a8f294c09b1987ccb009f9f0746787fbc5bebecd627dd8af8006956b770"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.12.1/pup_1.12.1_Darwin_x86_64.tar.gz"
      sha256 "45d62a2636b6308f778f16c33ffe5942432f9d542b00b106234f12c89a197c54"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.12.1/pup_1.12.1_Linux_arm64.tar.gz"
      sha256 "1dc5a74c428a0b1ea97370df199642e53c0d596b6847584edad30c6e59f4ab22"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.12.1/pup_1.12.1_Linux_x86_64.tar.gz"
      sha256 "00169faa0a2608a8bca64a6513333d387f9b15ca4dedaf7d273c4203525177a4"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
