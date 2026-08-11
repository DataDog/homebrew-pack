# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  license "Apache-2.0"
  # Some 1.10.0 installs recorded their keg as version "64", which Homebrew
  # compares as newer than any 1.x release and so would never be upgraded.
  version_scheme 1

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.6/pup_1.10.6_Darwin_arm64.tar.gz"
      sha256 "aa89055d331b9ce8e7590233775ae80d473e84dbf0a38c876175c084550a4f80"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.6/pup_1.10.6_Darwin_x86_64.tar.gz"
      sha256 "2578886689ceeea220b538b3bb5f669dad3b89136e5a706be0188a5c34ecd046"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.6/pup_1.10.6_Linux_arm64.tar.gz"
      sha256 "724eb6307cd994e29af0fb544677d4dd293164d6aca1fe00bb319f090e6271b4"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.6/pup_1.10.6_Linux_x86_64.tar.gz"
      sha256 "aa99b7108440fab8b7396ff7c84d329e56ccd2a7faf3e70cd1f9e8ac131c574b"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
