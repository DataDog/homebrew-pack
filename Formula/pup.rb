# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.59.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.59.0/pup_0.59.0_Darwin_arm64.tar.gz"
      sha256 "bb4754a0c4afd90a149589e62da1870abdeedb9849330247dabb88d1dfbb28dc"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.59.0/pup_0.59.0_Darwin_x86_64.tar.gz"
      sha256 "557e380da1273a1d01ab7e75c3f2d1d6f2e37fbc002dc9c582fecfb907af1b76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.59.0/pup_0.59.0_Linux_arm64.tar.gz"
      sha256 "e36da3d72aa49bcaca8c1ccf3729bf216d0d4ee2b109f4af74e9012cde9576e3"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.59.0/pup_0.59.0_Linux_x86_64.tar.gz"
      sha256 "b96e4655019abd9990f64b2f014ab043e123d5f0ed285f4fe3382a93855eadc6"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
