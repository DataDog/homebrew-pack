# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.6.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.6/pup_1.6.6_Darwin_arm64.tar.gz"
      sha256 "44980a600eb1b84abc63cdcb3d53d1fd95d23260b6a106eede20386f5975c23d"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.6/pup_1.6.6_Darwin_x86_64.tar.gz"
      sha256 "59f2052f5763829ad20555698f8607078877c89c5f1ba169aeacd9ef114c059b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.6/pup_1.6.6_Linux_arm64.tar.gz"
      sha256 "358e22a32633388293b008946b01c0bfb0f6d1d3c27418df932245ae785bbaf9"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.6/pup_1.6.6_Linux_x86_64.tar.gz"
      sha256 "a4d613e29093e31ce1ff80cac829e690870e2de1aeb0a3bf3a6ca1e3ff4472eb"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
