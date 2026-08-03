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
      url "https://github.com/DataDog/pup/releases/download/v1.10.2/pup_1.10.2_Darwin_arm64.tar.gz"
      sha256 "91e4ea07a628caa7f155ba754692bc7d45b9619cfc2019c663ff304a67e99bb6"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.2/pup_1.10.2_Darwin_x86_64.tar.gz"
      sha256 "d601cb15a4d303fcba272804dd95c8b97be9987575e1d4a1606b7d372c6ed4e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.10.2/pup_1.10.2_Linux_arm64.tar.gz"
      sha256 "d31435d6e97e0104ff7e40895c3d526d6c2d25135027ee3bcba188cf7d362d97"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.10.2/pup_1.10.2_Linux_x86_64.tar.gz"
      sha256 "cba38e099f84d57c916003748bfa4c6d95eed8de70ee8195346bafc64a1ffe5b"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
