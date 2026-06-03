# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.65.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.1/pup_0.65.1_Darwin_arm64.tar.gz"
      sha256 "9748edde5c4c8885d1a39d29e0f6ec361b1ba7154a7c882c8945b72dbb3123c7"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.1/pup_0.65.1_Darwin_x86_64.tar.gz"
      sha256 "616e183c236f26b79f03787b878297e4a9004023ad8dfd875bedb8655fb8dea3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.1/pup_0.65.1_Linux_arm64.tar.gz"
      sha256 "25b3b832be0df03c797c75bb8fec2810c4f9afa583282127b8035da8fc78532d"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.1/pup_0.65.1_Linux_x86_64.tar.gz"
      sha256 "38fe3d5f6c37cf7e9d67e116d91b5acf70d92a59fb86ecaf143ba5a58b7c60e5"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
