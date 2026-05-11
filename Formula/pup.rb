# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.58.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.6/pup_0.58.6_Darwin_arm64.tar.gz"
      sha256 "95c7505bbd9688405f0951ce6a874a7e05ded546af6df8bfbea5f9b73d539ffd"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.6/pup_0.58.6_Darwin_x86_64.tar.gz"
      sha256 "fedb6b13859c77340784abdefcf864bf8c3f33bfe175c5226e5d0af7eb728d2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.6/pup_0.58.6_Linux_arm64.tar.gz"
      sha256 "3a66757b49e65181054f5b0515099a83b9e74731ec5a30aef3e8bd13821e27da"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.6/pup_0.58.6_Linux_x86_64.tar.gz"
      sha256 "1a5081c6203d44fea5815d6d107305af237d01491be619d3cf0eb68a65291f86"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
