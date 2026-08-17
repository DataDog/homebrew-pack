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
      url "https://github.com/DataDog/pup/releases/download/v1.10.9/pup_1.10.9_Darwin_arm64.tar.gz"
      sha256 "15e6c111716445f03d4adedf164b6ab72bf8d50e6d2d35a75332f310e652dd66"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.9/pup_1.10.9_Darwin_x86_64.tar.gz"
      sha256 "c21911b93799a8234fef21683584155fb66146cf67ff245468814d22bcc0d1f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.9/pup_1.10.9_Linux_arm64.tar.gz"
      sha256 "a37cdf4488cfed1b4408594b198581d693d1b7a523d2169dc326bf0bb08f66ac"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.9/pup_1.10.9_Linux_x86_64.tar.gz"
      sha256 "7716c63f92f0be9d6ecd47766e9297a57454353aa93b823be57d704180525bf4"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
