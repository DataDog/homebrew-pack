# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.50.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.50.1/pup_0.50.1_Darwin_arm64.tar.gz"
      sha256 "1d3611c49a4a49e05b30cb05e74f7c26502926e30d7b00242d074f3c11318598"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.50.1/pup_0.50.1_Darwin_x86_64.tar.gz"
      sha256 "fc37cea9e50e281c482803b54ae776e56268906c7f2ba93b83b9758a4be9ad15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.50.1/pup_0.50.1_Linux_arm64.tar.gz"
      sha256 "30782b47200661edd627621c4daf828b42ce99d689f167f93c2e04b311942b63"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.50.1/pup_0.50.1_Linux_x86_64.tar.gz"
      sha256 "edbfe04fee6d6689411808160d95119ceddf5e647ed6a89ba8d69eaf85fe9902"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
