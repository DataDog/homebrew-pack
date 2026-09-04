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
      url "https://github.com/DataDog/pup/releases/download/v1.18.1/pup_1.18.1_Darwin_arm64.tar.gz"
      sha256 "bffa10dd45eae9768ad5a687ee67a3a131314b72d6c7cf730415ae8f744d207b"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.18.1/pup_1.18.1_Darwin_x86_64.tar.gz"
      sha256 "dc6b7c82a7ace6b02566881c43e3c5cc1bdae76231681ee41992f0178a8134e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DataDog/pup/releases/download/v1.18.1/pup_1.18.1_Linux_arm64.tar.gz"
      sha256 "85619302e9b74a091ee4ab76f47b7a435588db61369dca9058376de229d5f11c"
    else
      url "https://github.com/DataDog/pup/releases/download/v1.18.1/pup_1.18.1_Linux_x86_64.tar.gz"
      sha256 "e966dd6fe01cd3b75cc4f8eddf5bb38a463097eecf73cfbe0c4437db84604853"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
