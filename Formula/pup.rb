# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.58.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.3/pup_0.58.3_Darwin_arm64.tar.gz"
      sha256 "baa80d8cf7437d8fcc543258fedc1551a9e4dd3b917c4d3a2930044d3972e9f5"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.3/pup_0.58.3_Darwin_x86_64.tar.gz"
      sha256 "fcdefc38b6b69a999571305a3f91eaf635ecdf1ab7c6d8f590d9d1f81b190da0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.3/pup_0.58.3_Linux_arm64.tar.gz"
      sha256 "e47e7d02993fd3d7533c558f205319bbf858a71da7546a72112b6529089fbcfc"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.3/pup_0.58.3_Linux_x86_64.tar.gz"
      sha256 "61b50e2e2f891f6b36cbfe5aa0b676b44214be7000a414319f48b3522675a411"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
