# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.56.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.0/pup_0.56.0_Darwin_arm64.tar.gz"
      sha256 "35ae0b092184c94e7e9ce4ccd06c7f32a3d3cf3bb8dacd62f8af49e498621c87"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.0/pup_0.56.0_Darwin_x86_64.tar.gz"
      sha256 "1aa13ca5d5fc4a774d509ed9037e67ab2216d8564174154df75e57a1cff8213c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.0/pup_0.56.0_Linux_arm64.tar.gz"
      sha256 "04b9d61902335bc7a79841be1dddc1dff7df42b388103f095f57907ea9296b4b"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.0/pup_0.56.0_Linux_x86_64.tar.gz"
      sha256 "0e098f7469ddd0585a1aeadf59c293ef2accceeae409b92f300a39a9372cd709"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
