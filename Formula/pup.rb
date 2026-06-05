# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.65.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.4/pup_0.65.4_Darwin_arm64.tar.gz"
      sha256 "9d28d21ba94efcae64cde13cf71119c60209d21f789a257f96ad1d278fb41df4"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.4/pup_0.65.4_Darwin_x86_64.tar.gz"
      sha256 "0fb6307f288193520cd314a36d208a359daabb03cf221a340f9fc033f4695b3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.4/pup_0.65.4_Linux_arm64.tar.gz"
      sha256 "7f4606a6656715f5e1b258f3149c42a9202c1b56a6ee873be7785b291db04823"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.65.4/pup_0.65.4_Linux_x86_64.tar.gz"
      sha256 "da89c571fb2a8864b5bba7c09eaeee784308adf670c9b5c459e44f014534ea91"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
