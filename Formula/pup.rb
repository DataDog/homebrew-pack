# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.0/pup_1.10.0_Darwin_arm64.tar.gz"
      sha256 "a72d71b8478e5355cc673177ca00592a60457117e83e494f19d2cd9085defffb"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.0/pup_1.10.0_Darwin_x86_64.tar.gz"
      sha256 "2360c1799db9c1916791d8d6e27883e00ae0313927857070e80307bc5945f118"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.0/pup_1.10.0_Linux_arm64.tar.gz"
      sha256 "58ff322675c992f489b460e8c1e54a7dc78eda5a680aff763d99669908523dd6"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.0/pup_1.10.0_Linux_x86_64.tar.gz"
      sha256 "e768f381f20fc4ede7eb5bc55ce015b545856205f4b7d87b40d3c7aeabd40dab"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
