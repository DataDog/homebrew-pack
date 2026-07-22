# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.7.0/pup_1.7.0_Darwin_arm64.tar.gz"
      sha256 "9e1d7fb1dcec60fbc8fecc8bc1485bd3642d9823464b069946b73396815b3605"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.7.0/pup_1.7.0_Darwin_x86_64.tar.gz"
      sha256 "8aad1bad2d7a084dde9105eb570a29eae1a90882404938483bf133c90eaa1e84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.7.0/pup_1.7.0_Linux_arm64.tar.gz"
      sha256 "ff82a1bae6f4c7bf203c345ce440b386d43ef6533aaf7ed48c4b94e9f04a320a"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.7.0/pup_1.7.0_Linux_x86_64.tar.gz"
      sha256 "a604ed0ede7e0e607b901ff6e193f761995dd781eba5e7db1a8c139ad1b76644"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
