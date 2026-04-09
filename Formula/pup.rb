# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.46.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.46.0/pup_0.46.0_Darwin_arm64.tar.gz"
      sha256 "04ca30027ab83ab545d16aa011348ad1b42160bb0bb66fe6dce8bb8a8233de53"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.46.0/pup_0.46.0_Darwin_x86_64.tar.gz"
      sha256 "8989b39d516c0ea5b4a61e795c9cd20b203460bd0098311c0640737cdcfddb0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.46.0/pup_0.46.0_Linux_arm64.tar.gz"
      sha256 "2d76973076d808ddf2bbd1de3b1b692966757b5cf5903dccfefc6334c06d21c0"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.46.0/pup_0.46.0_Linux_x86_64.tar.gz"
      sha256 "6efa11d8b2325cd0f8b132dbb459e6a0706e0fe936aaae0e366f5544c3c4a5cf"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
