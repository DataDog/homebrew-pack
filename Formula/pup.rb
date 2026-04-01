# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.41.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.41.2/pup_0.41.2_Darwin_arm64.tar.gz"
      sha256 "b7fac043151dc3df89c04a302211bc57a93ec6674e712722ae47577b042ee578"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.41.2/pup_0.41.2_Darwin_x86_64.tar.gz"
      sha256 "6d70f4a3139b668c110e8d9d58f498a58db860a1bfea787542470b7d6485a8cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.41.2/pup_0.41.2_Linux_arm64.tar.gz"
      sha256 "2627e4a471c69d58948a735b6672fe18275b8d78205cc63d317d82c594fb196f"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.41.2/pup_0.41.2_Linux_x86_64.tar.gz"
      sha256 "2a103fecd40bf680f3d126ce92ac1636ba7ebd5bf19d5d823c52eb10b8d61294"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
