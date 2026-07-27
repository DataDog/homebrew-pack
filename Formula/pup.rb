# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.9.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.9.1/pup_1.9.1_Darwin_arm64.tar.gz"
      sha256 "a9d416b8bf00a54ed47d657ce1fdb26b9a6a09e60ff36d98a101ebdbcbac0913"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.9.1/pup_1.9.1_Darwin_x86_64.tar.gz"
      sha256 "35b5530998c89bb3ba837dc1ef4147cac651b02b2d856c834c65a84a7c62f2cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.9.1/pup_1.9.1_Linux_arm64.tar.gz"
      sha256 "59df9d1e2b1cd90b1006d18a422873d55c63ce04b7e82444d45d54cd0b0e913b"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.9.1/pup_1.9.1_Linux_x86_64.tar.gz"
      sha256 "d012e6bb0a25c01c0ea6830270d43044f8a16eb7afb753c94b1fcad32b785344"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
