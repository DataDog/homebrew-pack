# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.53.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.53.1/pup_0.53.1_Darwin_arm64.tar.gz"
      sha256 "4c6e8ec5ed6f53cf3d99ded83c6f4a4fca373c64a66dcba16dd227b3e1e8ada6"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.53.1/pup_0.53.1_Darwin_x86_64.tar.gz"
      sha256 "1ab2ee616519c119d062525c840d1daf0251ae4ae3635055838ce44a396ad1ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.53.1/pup_0.53.1_Linux_arm64.tar.gz"
      sha256 "81a0f5949795f8df5d742000890703dcffbed60889bae999f7281033710cd457"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.53.1/pup_0.53.1_Linux_x86_64.tar.gz"
      sha256 "c8a456b7c0bbaae157dcbebd0c770abf3dd053be5bf11d36bc258affc9c92620"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
