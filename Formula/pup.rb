# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.58.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.0/pup_0.58.0_Darwin_arm64.tar.gz"
      sha256 "3f1e09695afe613255898d22a77833b3fd2106e94c2b48d7de121455d50c81d1"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.0/pup_0.58.0_Darwin_x86_64.tar.gz"
      sha256 "c2e993fe36172c2e4baa6aad82f0f06d20981cea51d039e0e22e4296ba8c147e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.0/pup_0.58.0_Linux_arm64.tar.gz"
      sha256 "0bc82ab6e371803ee152c0f8534eb82c67147d59026893df2759e1c7e01a0b7b"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.0/pup_0.58.0_Linux_x86_64.tar.gz"
      sha256 "6ffa2d827f66f2d32b4d6ea557ad0ab8616f8983c3a5c7d16031887a96675893"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
