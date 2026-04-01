# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.42.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.42.0/pup_0.42.0_Darwin_arm64.tar.gz"
      sha256 "aba07c751447077d523c54e2a5cbffdc9e502b104947f61d7829b67a5b93e1eb"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.42.0/pup_0.42.0_Darwin_x86_64.tar.gz"
      sha256 "03e0eaf8724bfd765eaa5282665421df9d5e9214bc6db21c28cf8d301da00775"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.42.0/pup_0.42.0_Linux_arm64.tar.gz"
      sha256 "fe5273431eb51ba12e6637fde5bccde62ac2b9532495bee567575f2b5bb93f96"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.42.0/pup_0.42.0_Linux_x86_64.tar.gz"
      sha256 "7dfb16a55b10bd19ce4d630888641d13b0614aa8d8fc8eec2928483b2a1ffe2e"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
