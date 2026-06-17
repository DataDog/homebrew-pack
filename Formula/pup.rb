# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.2.0/pup_1.2.0_Darwin_arm64.tar.gz"
      sha256 "ad83acfb3b60e143c815159a62c949833d1faec5a0d9a45111473994db74d965"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.2.0/pup_1.2.0_Darwin_x86_64.tar.gz"
      sha256 "c536849ea43ed1a8926583b4772ebd3ac8fdaaf4cd424476b5a112b6ec42cc1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.2.0/pup_1.2.0_Linux_arm64.tar.gz"
      sha256 "ff7f9ed53d8c9926c12188f76b42d8a27358d7c7541d2a3fd8f5ce380c6a716b"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.2.0/pup_1.2.0_Linux_x86_64.tar.gz"
      sha256 "70ec6ab1d13cd490fedf100a8100d2b17712c80882a2b5cacbcda1c9c41c8f97"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
