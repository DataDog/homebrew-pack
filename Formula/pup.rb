# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.48.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.2/pup_0.48.2_Darwin_arm64.tar.gz"
      sha256 "f856f58cfb4c3539009a16c55f736a50c714f1eebd919b0d690ad6820d1b4d0c"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.2/pup_0.48.2_Darwin_x86_64.tar.gz"
      sha256 "a4f696ad47835ba1081c76689ca60aeaaf2ad9214f23e9926810602d352a7e6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.2/pup_0.48.2_Linux_arm64.tar.gz"
      sha256 "cbe0f52035466c39efcfbfb351b39f08bf63e72414dacc5ddf791fb9cbe6fd46"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.2/pup_0.48.2_Linux_x86_64.tar.gz"
      sha256 "bfaa4fbb6a53fbbb3613ad9f4c56c7788666a89c17f4a130f21a83dee3fd1491"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
