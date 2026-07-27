# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.9.0/pup_1.9.0_Darwin_arm64.tar.gz"
      sha256 "e5021612aa4da15b87e81733fffc4acc3deb012093d1fcd26bad3a8833ecd31c"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.9.0/pup_1.9.0_Darwin_x86_64.tar.gz"
      sha256 "ba8c5dde836e038958cb7c795158b235c94767e3a70bad251c3cb5b7dd2f2d47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.9.0/pup_1.9.0_Linux_arm64.tar.gz"
      sha256 "1b146054acde852ccdd0fbe092228f5437afff50d281fe89f345a8564df9e744"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.9.0/pup_1.9.0_Linux_x86_64.tar.gz"
      sha256 "0acaba9acf5d53b9eff9f6ecc8e4c867d4deec407efd4b065746a71f67b4e405"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
