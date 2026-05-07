# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.58.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.2/pup_0.58.2_Darwin_arm64.tar.gz"
      sha256 "ecd05b466f4344e260091ca6953efd5d693b01d847c1825c51da70c7de37ff88"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.2/pup_0.58.2_Darwin_x86_64.tar.gz"
      sha256 "102dfca465aa3e6b1d390e1289751f000c980dfa3575f57e6a5837d5fd57c836"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.2/pup_0.58.2_Linux_arm64.tar.gz"
      sha256 "f0817d555cca3af1e8a08e739ab7e48c33e085f953251c5b29fca2dfd8ee7c86"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.2/pup_0.58.2_Linux_x86_64.tar.gz"
      sha256 "a228ede77f89d4d8591a1698b5ffca7a6e115b868b37c4ceb3082fbd727c9ed5"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
