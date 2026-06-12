# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.1.0/pup_1.1.0_Darwin_arm64.tar.gz"
      sha256 "e8755196f8185e1eff982dfa65115ec0fc095abd82facdd4a097777382c82bb6"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.1.0/pup_1.1.0_Darwin_x86_64.tar.gz"
      sha256 "0615d0d460bff7338d8117e4e4a7c3d6d947493e44b1a7cda2915911e53ca6aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.1.0/pup_1.1.0_Linux_arm64.tar.gz"
      sha256 "c7657f63efec82676de57b7ef7f8e7d728a916aa0886fe2cc65ad90525e986f6"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.1.0/pup_1.1.0_Linux_x86_64.tar.gz"
      sha256 "2b37d4ac99e5cec0571fff3cddaf00067ec0da27c1acaa816e3bea6241886e3a"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
