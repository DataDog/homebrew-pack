# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.33.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.3/pup_0.33.3_Darwin_arm64.tar.gz"
      sha256 "f5efb6eb2cb6476cd89613dd8051294e616a27976be4cb74ae9e307a08dbaf75"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.3/pup_0.33.3_Darwin_x86_64.tar.gz"
      sha256 "a81fad3cd51f188ebd1797f315991ca889c9e22400d4b51c6f36e2f64a53ad91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.3/pup_0.33.3_Linux_arm64.tar.gz"
      sha256 "03d372fc1d02d8035598d7c6549e240e3f0e1193205848c05c128dabb4092d47"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.3/pup_0.33.3_Linux_x86_64.tar.gz"
      sha256 "3159e9dde2c8d1c0c905401f7aa253a8622c3b1d9294ce85eae99795cb132eb5"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
