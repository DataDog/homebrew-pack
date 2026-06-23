# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.3.0/pup_1.3.0_Darwin_arm64.tar.gz"
      sha256 "1079adafbbe1f2a652981fa9f3bc8ed19d47c7bfb92810aa1cf60d366b102cdf"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.3.0/pup_1.3.0_Darwin_x86_64.tar.gz"
      sha256 "d891323353975d31fa35630b3864b1af3af64306c4f7279c226f26270e760e10"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.3.0/pup_1.3.0_Linux_arm64.tar.gz"
      sha256 "951d9648dd6a9b0ecab2dc00cd47643dcc1512a84c8b3a60b1cc17502b51a1a3"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.3.0/pup_1.3.0_Linux_x86_64.tar.gz"
      sha256 "214bcf80efa783ab64bab525448cc9d84081d44f5cb7a595b80a7747c3dd7db7"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
