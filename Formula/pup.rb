# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.8.0/pup_1.8.0_Darwin_arm64.tar.gz"
      sha256 "c62cc9f69f23a89e1dc123c7bd04fbc3f150295df452b91a8d681fb6e951ff6f"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.8.0/pup_1.8.0_Darwin_x86_64.tar.gz"
      sha256 "3fc0613459b91643507660c6d6dbdbfb6262be38503acf829d5a8286f52b3889"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.8.0/pup_1.8.0_Linux_arm64.tar.gz"
      sha256 "b8b44ed232ca267773c0138d348abad709bcee10dbf3ad79152bc8e283023567"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.8.0/pup_1.8.0_Linux_x86_64.tar.gz"
      sha256 "bd034d43e7b7ebc2bed05f6e1c172428a0d369d341ac415fdaac6e1776db23e9"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
