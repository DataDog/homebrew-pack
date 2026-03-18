# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.33.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.0/pup_0.33.0_Darwin_arm64.tar.gz"
      sha256 "c2cb3af041e61e07f47a3173cf885de17676e450791c255a9cc8d03d46e8035e"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.0/pup_0.33.0_Darwin_x86_64.tar.gz"
      sha256 "54a994970e458b7f24f3c6201b4920dc408786a246c5f2c28b4c5fd847f03129"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.0/pup_0.33.0_Linux_arm64.tar.gz"
      sha256 "605aa8c9a5edbaa7c15b322de45f2f4e7e4afe850d3b88200638022a3f3bc5e3"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.0/pup_0.33.0_Linux_x86_64.tar.gz"
      sha256 "b8fbdf4ea6bab350e249cb6cf3dd68d1105a567b9af59a30c507a7b735e64f47"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
