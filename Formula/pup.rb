# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.52.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.52.0/pup_0.52.0_Darwin_arm64.tar.gz"
      sha256 "6e02fc784ebe25acf587a1fb41b26ac515275109ab0292231c0f9d7d89cda580"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.52.0/pup_0.52.0_Darwin_x86_64.tar.gz"
      sha256 "7398da6f3e45c2e20dbd3afbe759c6917a11c0797194f46008c90a6fc1b3ca9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.52.0/pup_0.52.0_Linux_arm64.tar.gz"
      sha256 "594d79a3349ec21eed05290ddfc194f0475814fb7b9383788a10dc4e8ea480b6"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.52.0/pup_0.52.0_Linux_x86_64.tar.gz"
      sha256 "23de44f6c3653555cdc6ca8fe799e0301946204eea21e374e12ee3383f180fe3"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
