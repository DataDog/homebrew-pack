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
      url "https://github.com/DataDog/pup/releases/download/v1.13.0/pup_1.13.0_Darwin_arm64.tar.gz"
      sha256 "0c4266f52485a5c233bbf53c55b265f86ebf5dacea6cddf8eee9de7ea5ff58dc"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.13.0/pup_1.13.0_Darwin_x86_64.tar.gz"
      sha256 "c672185aa0bd40a103b916d728fb50cb94cc95f9c75c461dc239f68b0b73858c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.13.0/pup_1.13.0_Linux_arm64.tar.gz"
      sha256 "7ba2a280abef83aba32796e2933beffc9f7e4d1ce1e987911bbcafd8d4453bb4"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.13.0/pup_1.13.0_Linux_x86_64.tar.gz"
      sha256 "f105cc370ac59cac076b6c571c7259832b532b6200f664809b77c355bed22225"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
