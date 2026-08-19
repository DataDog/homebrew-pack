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
      url "https://github.com/DataDog/pup/releases/download/v1.12.0/pup_1.12.0_Darwin_arm64.tar.gz"
      sha256 "d5db3a54b62418268676c7338ba0692c9e75964645ff239a51af803d8ce1fbea"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.12.0/pup_1.12.0_Darwin_x86_64.tar.gz"
      sha256 "4e9edba16e29245e76fbb3689c130d2c0e1668aa34cf067d6321ada6b5611f69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.12.0/pup_1.12.0_Linux_arm64.tar.gz"
      sha256 "7899add16a12bff9b18501b2880c66770556e5d4fd2d502ba0eca1e379133cb0"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.12.0/pup_1.12.0_Linux_x86_64.tar.gz"
      sha256 "235c7a8412d42e0810882a0ed27fe5fc9cffdcf47ecc82b3af85446cebb5ceab"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
