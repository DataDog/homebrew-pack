# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.60.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.60.0/pup_0.60.0_Darwin_arm64.tar.gz"
      sha256 "365a04d6296ded8d819a8923a37ed8c20752ebba1827bd4f1f1849cc2797913d"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.60.0/pup_0.60.0_Darwin_x86_64.tar.gz"
      sha256 "4c2d84e9ee9185b2ba6356ccb1f7afb0da485fe6915c1f48be6cd30b27ac47f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.60.0/pup_0.60.0_Linux_arm64.tar.gz"
      sha256 "e303e00e98dec082c925128ba2c18075b3ec16c137cd4f597fb550cb7994ec56"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.60.0/pup_0.60.0_Linux_x86_64.tar.gz"
      sha256 "5d7e781673e2f7fcfc928d84af69a4f23b315328d305a71d7c1474a9d06c3a68"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
