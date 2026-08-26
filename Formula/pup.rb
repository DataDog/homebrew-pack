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
      url "https://github.com/DataDog/pup/releases/download/v1.14.0/pup_1.14.0_Darwin_arm64.tar.gz"
      sha256 "0aa09a7a633ff8fbe8a07dbf19e9a07670bd91523371fe2d325aab8ca565ce4c"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.14.0/pup_1.14.0_Darwin_x86_64.tar.gz"
      sha256 "1e0fce9e5895bbc7a070695439088b8c162dc02d3e26fdf51d278ac8a0fb3835"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.14.0/pup_1.14.0_Linux_arm64.tar.gz"
      sha256 "1d4bdc7eb8ae2d57867c9c0086165a9299a57f510cee6182cca0a89b57918619"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.14.0/pup_1.14.0_Linux_x86_64.tar.gz"
      sha256 "be5fa868d39337c373c42abd4073f6acfbff9f97f12351915894bd7b3f4c8ec7"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
