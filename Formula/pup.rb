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
      url "https://github.com/DataDog/pup/releases/download/v1.16.0/pup_1.16.0_Darwin_arm64.tar.gz"
      sha256 "3c7a022c345b4f60db1e5d7ae0f6ef9a45c672320ebcd956c52713e1d3f00ef2"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.16.0/pup_1.16.0_Darwin_x86_64.tar.gz"
      sha256 "48ba2579a3cb511a0a0964b2ad13df1af7ff7b465402df4892e58cbeff25d002"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.16.0/pup_1.16.0_Linux_arm64.tar.gz"
      sha256 "df30985d18d46d159439cb2aa6d7bd3b3e1bdfe83471614b5b4775180ab3562e"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.16.0/pup_1.16.0_Linux_x86_64.tar.gz"
      sha256 "6f5fe9efd3b46c68b34369805e048d7fbd3ca0abfcd004b998505f0c7232fcaf"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
