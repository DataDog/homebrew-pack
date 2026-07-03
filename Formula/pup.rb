# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.6.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.2/pup_1.6.2_Darwin_arm64.tar.gz"
      sha256 "7abf27cc0e7ba496ebebaede5837665940b69d3856068af8967b6790687fa6f6"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.2/pup_1.6.2_Darwin_x86_64.tar.gz"
      sha256 "74c13c5ea6f2f815959f71a8e561c4513a6e60e20dbdc08d31d09ed082ecb442"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.2/pup_1.6.2_Linux_arm64.tar.gz"
      sha256 "00346d560fb711bd1fdda534d5b2100ded8169eff59e716c235155bf701c76f2"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.2/pup_1.6.2_Linux_x86_64.tar.gz"
      sha256 "ee502c5b3c7b3d5672c0eada88fdb9638f8b80849fb8ffba6a2de9db9d29572f"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
