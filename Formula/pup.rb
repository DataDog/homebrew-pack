# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.54.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.54.1/pup_0.54.1_Darwin_arm64.tar.gz"
      sha256 "d94ca86a1d7b0e8521392242ba880de222d0054b38db05cbf016bf5852d1728a"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.54.1/pup_0.54.1_Darwin_x86_64.tar.gz"
      sha256 "e110fa3134491ddd499d0bb11012f277cb9e0f45120e28b70286d412b8e8fa83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.54.1/pup_0.54.1_Linux_arm64.tar.gz"
      sha256 "006df0e1418c3af85dd20ba56cd8c1b6e57729380cc666f7d1f9362e78bb2d62"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.54.1/pup_0.54.1_Linux_x86_64.tar.gz"
      sha256 "c964fb0555b4c38f5eff41118f28e2236c2ae95586d275cf4cd6f3bffb59c968"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
