# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.9.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.9.2/pup_1.9.2_Darwin_arm64.tar.gz"
      sha256 "3f03cf4d6f9054073145c78ba4551fdef31f67ed11c4122d735d67b00b975509"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.9.2/pup_1.9.2_Darwin_x86_64.tar.gz"
      sha256 "002d92befcdeb1ba2c774bbfd62206634c60b9d83f7648157b3e6d20ed984216"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.9.2/pup_1.9.2_Linux_arm64.tar.gz"
      sha256 "482b66051eddaa5245728ecf899b54d9e59957e43027693ce57f6a9893b4c0f0"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.9.2/pup_1.9.2_Linux_x86_64.tar.gz"
      sha256 "0ed80489f8af14e61dd3ce46ed600ad474c2668289b71ab5c8c0252ba168d806"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
