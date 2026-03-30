# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.39.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.39.0/pup_0.39.0_Darwin_arm64.tar.gz"
      sha256 "905153f1f5710adaf64b6eefbd331b0d8e35ea900e6a464b8f40c836db7b1bd0"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.39.0/pup_0.39.0_Darwin_x86_64.tar.gz"
      sha256 "f1b12a1fa4e4c16994d62f6d0d7cfa5d3fd991eef9699036affa01dbe80c6597"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.39.0/pup_0.39.0_Linux_arm64.tar.gz"
      sha256 "db284f098a63bab6cd2f4005902821b38e67708fafc8ed209aa751af9784bb09"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.39.0/pup_0.39.0_Linux_x86_64.tar.gz"
      sha256 "0acd58fdfcbf08a09acba0f73b0d511f71fc5d13e31aca0598e72aaf23d648de"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
