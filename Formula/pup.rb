# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.35.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.35.0/pup_0.35.0_Darwin_arm64.tar.gz"
      sha256 "d2b2af4165dafef6a1d305fb02b0d9ae7089a86222ea669d4d2d39c1c7e9faa7"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.35.0/pup_0.35.0_Darwin_x86_64.tar.gz"
      sha256 "f8426f91bc34ea5104149ab5895bda30624dac049ce92d695e7795e1b61b49e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.35.0/pup_0.35.0_Linux_arm64.tar.gz"
      sha256 "0a2a419d16adee0df8276607e285a8071795b6c6e5d4527a9e22de8c10b0d695"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.35.0/pup_0.35.0_Linux_x86_64.tar.gz"
      sha256 "d4a6965c0eafb8ccc0c17b5a65fe7291b2faea98778d339336634c7465cd76ab"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
