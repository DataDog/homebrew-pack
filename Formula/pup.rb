# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.63.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.63.0/pup_0.63.0_Darwin_arm64.tar.gz"
      sha256 "6c64f5654802e63719e57eae2bde2c906512831c3ffa83e7570d06938881ca21"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.63.0/pup_0.63.0_Darwin_x86_64.tar.gz"
      sha256 "4e3f4ed26b1d29401da55061e42ae48a9abe79c8d8a4c70fcb061b2e76ada5f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.63.0/pup_0.63.0_Linux_arm64.tar.gz"
      sha256 "855021b4856dde2e3553ca005f7e79dd0936ffc2d2b5213b6da2be064162dbd0"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.63.0/pup_0.63.0_Linux_x86_64.tar.gz"
      sha256 "794776698c638561c59dff2b73898b6e269f0e3eeabf6711f6a2693805e685a3"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
