# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.5.1/pup_1.5.1_Darwin_arm64.tar.gz"
      sha256 "9f9f95aa7d317e74bdd1f48a81956507fe6db42673c30b7fa219478a6a369245"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.5.1/pup_1.5.1_Darwin_x86_64.tar.gz"
      sha256 "96cb95c4d5b6191741e2125b0b7f5dc4fa0a436130120410a6b726407ed03840"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.5.1/pup_1.5.1_Linux_arm64.tar.gz"
      sha256 "11ac53ccb90f9869faa7ebaf2c75a4b516ba52ce95eea9fd55d0910bb52162bd"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.5.1/pup_1.5.1_Linux_x86_64.tar.gz"
      sha256 "0cafa3044355220b02b002c1a8e2ffec7f360a0a0a5e59eac0a56dc60e59c1c7"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
