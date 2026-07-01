# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.6.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.1/pup_1.6.1_Darwin_arm64.tar.gz"
      sha256 "53d2f6614cd0425acfcb211eecd78ff243cf9911f15827f65b3e8b77772d1e43"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.1/pup_1.6.1_Darwin_x86_64.tar.gz"
      sha256 "0cc1b079a85c480ce5b228102c5eca7b45355b4fbe36cf29f0706f5cbfd13e31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.1/pup_1.6.1_Linux_arm64.tar.gz"
      sha256 "cda6cc38cfcb9115fa7c7af19466d761e2b97d4d71f3baf50cb2edc28aeb4f7d"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.1/pup_1.6.1_Linux_x86_64.tar.gz"
      sha256 "3d117c8d8a1b89c4925dfc8b05dd3a074411da1cd7c3a96045670fc7aad210a5"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
