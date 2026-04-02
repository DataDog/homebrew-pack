# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.43.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.43.1/pup_0.43.1_Darwin_arm64.tar.gz"
      sha256 "a7169c377d1ecfbad09b398999f956e96d799415617fb041e4a59e543f0cbdf9"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.43.1/pup_0.43.1_Darwin_x86_64.tar.gz"
      sha256 "56bc8b461ea2fa50d9783d934b42444c22fe48111631565cace31f5cdd5cffbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.43.1/pup_0.43.1_Linux_arm64.tar.gz"
      sha256 "be775a4444927c0337a988f5bbe336abd20ce7028343bccb19f150a99f95a25b"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.43.1/pup_0.43.1_Linux_x86_64.tar.gz"
      sha256 "7412612e79d0140aa4eee8647e5efdddfbc812d4971caec8c27314e07fceddba"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
