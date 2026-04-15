# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.49.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.49.2/pup_0.49.2_Darwin_arm64.tar.gz"
      sha256 "f2ab2aef403d76b882f8caa6b4e129382b28ac1e8c62431c99e63955d904dc12"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.49.2/pup_0.49.2_Darwin_x86_64.tar.gz"
      sha256 "46042739edc2d35448363719c92715f47c8cc26514e75c9bf54430892218dcf3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.49.2/pup_0.49.2_Linux_arm64.tar.gz"
      sha256 "a41a27aee8022bfc56e7fa2d70c905fc519f65150e2cc81e38f9bb11e4350fa0"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.49.2/pup_0.49.2_Linux_x86_64.tar.gz"
      sha256 "0985cc37d19b6291ce6faba209773d33dee5ea5ccdda023b03b90c46cabe819b"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
