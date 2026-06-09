# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.0.0/pup_1.0.0_Darwin_arm64.tar.gz"
      sha256 "7f9ac8626f9e927f1b1e486cc6cd801aa769e5f36d7bf4781b98f42b7778b97c"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.0.0/pup_1.0.0_Darwin_x86_64.tar.gz"
      sha256 "d0125eab04ed699e6deda7cb78cdf2e988f0dce6a8a134a167730d3ad1cb1039"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.0.0/pup_1.0.0_Linux_arm64.tar.gz"
      sha256 "2afa4e44b559072b1b871672c93cd4ba1f6913fae20a37bebf61950a946c041b"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.0.0/pup_1.0.0_Linux_x86_64.tar.gz"
      sha256 "f672ee800cb48090df1336fe4fff0b923e6ea22ab7bacf81c60bf1fbe686fe0a"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
