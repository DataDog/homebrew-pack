# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.48.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.0/pup_0.48.0_Darwin_arm64.tar.gz"
      sha256 "1006bd7a22960e1b289aaa173d5ef24e1bc2c5490a4c2a02f7c16a2c9367e1a3"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.0/pup_0.48.0_Darwin_x86_64.tar.gz"
      sha256 "f807b626638af44ba5439e8d1c9f9bdaaf24033bc9108efe68c91e81fa2e3da8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.0/pup_0.48.0_Linux_arm64.tar.gz"
      sha256 "9bba34205eac74b881d430149744ed38cbb376cb5188aca0439141e1a81c71e2"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.0/pup_0.48.0_Linux_x86_64.tar.gz"
      sha256 "b44f29516416d8896f8e251c5a2fd8a8769e2f4eda12bef1ee287bd483f8f93d"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
