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
      url "https://github.com/DataDog/pup/releases/download/v1.11.0/pup_1.11.0_Darwin_arm64.tar.gz"
      sha256 "0565cdf5d2eb3f6dc72002df7a3ddaabe4af14d5399d2ae010a16647b3047bcf"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.11.0/pup_1.11.0_Darwin_x86_64.tar.gz"
      sha256 "0d11b5d48cc5bce1b618de5d75576444f58119e07879f154918fa29e1a9ab7d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.11.0/pup_1.11.0_Linux_arm64.tar.gz"
      sha256 "29d790a813463a6ef0a4b04e64eae63ee81f4ccbd54cf3927d518dfde658a316"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.11.0/pup_1.11.0_Linux_x86_64.tar.gz"
      sha256 "f4213167589d47d3c0843d2344c5123e6800149c2ae284b0e5ad765fda4e96ae"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
