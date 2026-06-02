# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.65.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.0/pup_0.65.0_Darwin_arm64.tar.gz"
      sha256 "e68487279990696c8286e737f69e5e1e83e2714e543268a08209c99b8ee75a31"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.0/pup_0.65.0_Darwin_x86_64.tar.gz"
      sha256 "28f3a223918591659dc6adecb81d1de11f6a46ae7430466244eaa5a9ab09e729"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.0/pup_0.65.0_Linux_arm64.tar.gz"
      sha256 "35cac4636f6f1a16af052d7c05e41119d1428fab30f016a53e541d302b16a859"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.0/pup_0.65.0_Linux_x86_64.tar.gz"
      sha256 "99382c2ed7f25cd8db10bab73512208fe49ccc681dc4671dfcd481631b8a1522"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
