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
      url "https://github.com/DataDog/pup/releases/download/v1.10.7/pup_1.10.7_Darwin_arm64.tar.gz"
      sha256 "54de31b6f596c81268dfcc092e794dd7d115a861eaab463020c65a0e4ca98d53"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.7/pup_1.10.7_Darwin_x86_64.tar.gz"
      sha256 "079bd30c0b433a8af89bbd8e9f8ebd72da140c9aa214fcf2989183d7c8593258"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.7/pup_1.10.7_Linux_arm64.tar.gz"
      sha256 "3eea5168b33e3363408f648fedc73a063b2f91bc3f4adba6848cfa0b7ca06fd7"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.7/pup_1.10.7_Linux_x86_64.tar.gz"
      sha256 "5be82d2ce4474feb6bf80568f2c7e5a5c4d238c0be6f67445178280f3ae2a410"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
