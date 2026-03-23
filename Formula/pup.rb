# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.34.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.34.1/pup_0.34.1_Darwin_arm64.tar.gz"
      sha256 "f6faf6604805e7eed4594ec82c867559d610bb71dc959c8e8b828d0564824db5"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.34.1/pup_0.34.1_Darwin_x86_64.tar.gz"
      sha256 "d064f197257a9c104eca93dfb2a5d4824d531be7fbfe60f5502cb3ade13d3f60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.34.1/pup_0.34.1_Linux_arm64.tar.gz"
      sha256 "5fe206db1c9b948c4dd684cc788827c3784e3b2b6403b536bafaa343a6c9a4d1"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.34.1/pup_0.34.1_Linux_x86_64.tar.gz"
      sha256 "7d26509d56edf833061e3cf62cc94dcba5168954cd7accb41d8b9430a1c27ae7"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
