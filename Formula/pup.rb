# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.37.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.37.2/pup_0.37.2_Darwin_arm64.tar.gz"
      sha256 "4d13fd5c86eae99d5d1bfabda9c50eac69c34b958d4663f45de037ac1c8dbd36"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.37.2/pup_0.37.2_Darwin_x86_64.tar.gz"
      sha256 "bf978f28d9f849013f06e9c2e5c60a0d30d09893bc3c8b647a5eeeaf58e4384b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.37.2/pup_0.37.2_Linux_arm64.tar.gz"
      sha256 "424f06b1d0824df55fc4ea4a0eb01d5c0cc254caf393fb63f5ee72f02bf509f8"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.37.2/pup_0.37.2_Linux_x86_64.tar.gz"
      sha256 "c69e7bf67b14d844e78812dc2d67328e8ca4108e1592cbc999d47eb0799b2b42"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
