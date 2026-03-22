# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.33.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.1/pup_0.33.1_Darwin_arm64.tar.gz"
      sha256 "2ee015e99c360db1ea3f1515bdeb795600288e56f165980c58a24222cbbfd774"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.1/pup_0.33.1_Darwin_x86_64.tar.gz"
      sha256 "f9bdea542330b00d22d7918fb0e149c6017d3ece02f062de66aa992ae8bbced7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.1/pup_0.33.1_Linux_arm64.tar.gz"
      sha256 "32344e91f93bad85b2b54b03a906b49ef95de3189151e6d8cf80df20c2ba62b1"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.33.1/pup_0.33.1_Linux_x86_64.tar.gz"
      sha256 "c51e77e20b26bb25cae345d751b5258489e1fc127fb5f0e1e38efc4680b4d5e0"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
