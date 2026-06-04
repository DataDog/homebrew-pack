# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.65.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.2/pup_0.65.2_Darwin_arm64.tar.gz"
      sha256 "df05d5d64ffb4e9b6d25eb94a7ea1ee49315457f18b097cc7e920aadfc8902bd"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.2/pup_0.65.2_Darwin_x86_64.tar.gz"
      sha256 "a87e10917b06924ee441e97188c70d849567372305ac28e439c8f2557f80cdd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.2/pup_0.65.2_Linux_arm64.tar.gz"
      sha256 "4ffc6ed6b40f03fc1d07145438966d8eb98f614a532f5ba440034b108ca09d6a"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.2/pup_0.65.2_Linux_x86_64.tar.gz"
      sha256 "e3bd19e8c1d90ad3d7dc6a786ad362fe5b3b51d063557331444e552d7d5b1d6c"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
