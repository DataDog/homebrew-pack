# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.36.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.36.0/pup_0.36.0_Darwin_arm64.tar.gz"
      sha256 "42e78e34889557a1eaa1a3faa82ef2fe0e160ac71d25c52cf128dc9406cffb66"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.36.0/pup_0.36.0_Darwin_x86_64.tar.gz"
      sha256 "bdc7a9d782ff101de51a36a33dd61cdb8ca836c0562a97578a9981a6916f515f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.36.0/pup_0.36.0_Linux_arm64.tar.gz"
      sha256 "f65387e298d7eeb3d96637d7b19617bfbf10c75d8adc0814aac6f0fcf59cc118"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.36.0/pup_0.36.0_Linux_x86_64.tar.gz"
      sha256 "1de59e61fab5b84289c40f573329a04664357515dd4907c2ce91c4f2a5fdafcb"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
