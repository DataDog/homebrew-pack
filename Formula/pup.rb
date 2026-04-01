# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.43.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.43.0/pup_0.43.0_Darwin_arm64.tar.gz"
      sha256 "51436ab329f06add27783f5290af17d0d2c1d5a26cd38a1f33206803d1f00077"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.43.0/pup_0.43.0_Darwin_x86_64.tar.gz"
      sha256 "e63d9581dee26fe6a63666980a52cbeeda4dfa3b79396ebf4a6b13a409c9e7ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.43.0/pup_0.43.0_Linux_arm64.tar.gz"
      sha256 "c17c490930511ba8f7e17759061fa646872c65b5965fd2f4d9eb5ef23d1f47da"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.43.0/pup_0.43.0_Linux_x86_64.tar.gz"
      sha256 "0ef2213a070b3551a7863dfe343dcfab582e28ac53a83de0e9d28be45d98a537"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
