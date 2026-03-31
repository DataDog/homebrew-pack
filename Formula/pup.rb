# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.40.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.40.1/pup_0.40.1_Darwin_arm64.tar.gz"
      sha256 "137ee76d0670df2c6b9136e887736bf56c88a869167bee13ecd501ee898f50a2"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.40.1/pup_0.40.1_Darwin_x86_64.tar.gz"
      sha256 "61145d222926966025d1d664b8a774e1d2d08dc4970c32e05faa256a89ee8944"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.40.1/pup_0.40.1_Linux_arm64.tar.gz"
      sha256 "e172b4db9802bee0fe51d898ba6b60f128bd60fc60f8396de70169d1149b2d03"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.40.1/pup_0.40.1_Linux_x86_64.tar.gz"
      sha256 "b376fae129f0612cfe310fe4192486d22ee457e67fa70f0128c68f948031feb6"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
