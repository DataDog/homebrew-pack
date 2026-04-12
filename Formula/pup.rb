# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.49.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.49.0/pup_0.49.0_Darwin_arm64.tar.gz"
      sha256 "965d85c2fafad8be5b69e78b062ce4bfd20e94bbd5b1bb9a1da55cd6c297d0de"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.49.0/pup_0.49.0_Darwin_x86_64.tar.gz"
      sha256 "e2dbc6f1f46bac1456c31fd5f87874b89cfc512f0f7316b2f343df4bcf5f9e8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.49.0/pup_0.49.0_Linux_arm64.tar.gz"
      sha256 "2459daca9e428e60f9bb5f41fb3b343b20256f90c9c11f0a796d28357ca5d92f"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.49.0/pup_0.49.0_Linux_x86_64.tar.gz"
      sha256 "23a7e8384220d2494e1a97e82cd27f84cf22cdfeda0f9e65f183d7b8dc81c1e0"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
