# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.56.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.3/pup_0.56.3_Darwin_arm64.tar.gz"
      sha256 "f364a3992183ea82eb0f7d3f202016bc4810a25fe3ff4333daa6ef497b2af956"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.3/pup_0.56.3_Darwin_x86_64.tar.gz"
      sha256 "912ec42b9e6a501da3f386660c5c9ff244f316dd73200006e1387fcab0684f4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.3/pup_0.56.3_Linux_arm64.tar.gz"
      sha256 "269a5d18a3d5dcab8774c19c52e0103327bb45350580e3bd223a5492fe8d6f39"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.56.3/pup_0.56.3_Linux_x86_64.tar.gz"
      sha256 "2983187b32d68f7e4d519b369331be819b079e0670d8b546a47ccef414b86094"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
