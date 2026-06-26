# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.5.0/pup_1.5.0_Darwin_arm64.tar.gz"
      sha256 "40432206232fb33fec0eba1ecb5ec9d104128209fea66d74ad82e7933f7c8bf1"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.5.0/pup_1.5.0_Darwin_x86_64.tar.gz"
      sha256 "bb25e2e00430554f12148a6d5a2f5d6e9115f33d5040c82016b77518dec95827"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.5.0/pup_1.5.0_Linux_arm64.tar.gz"
      sha256 "87b4751a2bb62612ddcbd29ae7d97e5174237ded4000a5d74ed9ec8db1224951"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.5.0/pup_1.5.0_Linux_x86_64.tar.gz"
      sha256 "a6333238fabd0ff149f0e44d62a308f22effa46403188f0f951244ad089e8b38"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
