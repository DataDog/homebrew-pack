# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.56.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.2/pup_0.56.2_Darwin_arm64.tar.gz"
      sha256 "9844e5fafa0b7a5b366ccca645da8c0ee3a3ca0a77335159edef8b511d4c58da"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.2/pup_0.56.2_Darwin_x86_64.tar.gz"
      sha256 "06002160b8dde819b8cf2a1b9d37347d29fb5bb8fe016c47dc0af79850758e16"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.2/pup_0.56.2_Linux_arm64.tar.gz"
      sha256 "5a11cac6f494a558112e171abc3aeeb1b2d912baba883c19bd477668b67b25b3"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.2/pup_0.56.2_Linux_x86_64.tar.gz"
      sha256 "358508a90d31ef956b361d5092cfc4ed0f0987940e0f22b6c5fce17d431d7b34"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
