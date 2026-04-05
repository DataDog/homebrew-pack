# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.45.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.45.1/pup_0.45.1_Darwin_arm64.tar.gz"
      sha256 "b4d8936a446f9bb81a17253740b685b77e0d46959c903f87a2daa907b2ef368a"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.45.1/pup_0.45.1_Darwin_x86_64.tar.gz"
      sha256 "099e7c32ea51c6ad69101ba9e8aa2a207b0200d84ce562e8ed60a4a4486ed28a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.45.1/pup_0.45.1_Linux_arm64.tar.gz"
      sha256 "4d4941f3ea811e33fda9f0d2371bdacd00a15e93db46a2ecaa515e3b97d3cd16"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.45.1/pup_0.45.1_Linux_x86_64.tar.gz"
      sha256 "994b6a14b9c49627cfcc9bfdf91b4a27809bda7adf701b25a9820f0720a57431"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
