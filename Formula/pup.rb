# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.0/pup_1.6.0_Darwin_arm64.tar.gz"
      sha256 "34a775656637abaa3d8108ed5872ef7b5b83f9ff4a40b00943ac40bf0d0d6cc0"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.0/pup_1.6.0_Darwin_x86_64.tar.gz"
      sha256 "112d4538b5301780693cc6fadb0c3227cc5f91f61de479d5036591dcbd7f00e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.0/pup_1.6.0_Linux_arm64.tar.gz"
      sha256 "245d48a6ae64f3e1d64a4db8b86ac6af2ec84952e9133ed000f18c101284ab43"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.0/pup_1.6.0_Linux_x86_64.tar.gz"
      sha256 "13defc851eaf47af5b3ec829ba9f8603807cfe35d8e0f334013399c14d12616a"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
