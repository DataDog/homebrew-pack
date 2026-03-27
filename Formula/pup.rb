# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.37.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.37.0/pup_0.37.0_Darwin_arm64.tar.gz"
      sha256 "33b123db6454abe4e2049306227dfdb6dd9c89548bfac98c162561e687b50ea0"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.37.0/pup_0.37.0_Darwin_x86_64.tar.gz"
      sha256 "0a08605092cf964d977358b12ee0524a8b3fa4f225a4029ffd65576836b41f72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.37.0/pup_0.37.0_Linux_arm64.tar.gz"
      sha256 "8e08790ca014aa51c3a0f8fe37c6270cb053befb7151663556354cea8b51445e"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.37.0/pup_0.37.0_Linux_x86_64.tar.gz"
      sha256 "67b79598f722bf2dd96d4104831b998ddecb872f3bfb8b2eea77dcbc7babe758"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
