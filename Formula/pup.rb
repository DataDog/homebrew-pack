# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.58.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.4/pup_0.58.4_Darwin_arm64.tar.gz"
      sha256 "e3053c5bc44b081e678a96f185921895f7d8c7263de05209bb6730d4269c7566"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.4/pup_0.58.4_Darwin_x86_64.tar.gz"
      sha256 "697f206353f82a91ac98583efc478fac57c549234dbc460bdc23c5fc339372fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.4/pup_0.58.4_Linux_arm64.tar.gz"
      sha256 "a77901b3187dbb91f0573a98afe46f2c14be6b7281d2d490c8c4817b8f5b9131"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.58.4/pup_0.58.4_Linux_x86_64.tar.gz"
      sha256 "ccd1ea95bc09cd924d9d58472d427682bf5965a1ada7b55ab9861a4f3886cd1f"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
