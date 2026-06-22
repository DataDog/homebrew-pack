# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.2.2/pup_1.2.2_Darwin_arm64.tar.gz"
      sha256 "b67ffa64d12a1f03f4ff34cb170a0aa6336a24f0411893470f1a88a8a1b78849"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.2.2/pup_1.2.2_Darwin_x86_64.tar.gz"
      sha256 "f1a6ad7f6acef0f0fe180ebf230cb353d9dc159293bcd2a08b9d77767ba1d91f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.2.2/pup_1.2.2_Linux_arm64.tar.gz"
      sha256 "5d019a71c4c895fb091f15a8abb46c2e5f401d1a449c930176f34a73f61df5e8"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.2.2/pup_1.2.2_Linux_x86_64.tar.gz"
      sha256 "f3c7723da222f4eed1f4d697c89a139f96274b703b87773d77ce66cc22cbc6af"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
