# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.32.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.32.1/pup_0.32.1_Darwin_arm64.tar.gz"
      sha256 "26be70edc8e944ab2f643a7615b89a729ed78e4a3ef5ff1c3937bd1477ba6d35"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.32.1/pup_0.32.1_Darwin_x86_64.tar.gz"
      sha256 "e87cc715bf8372eebbff99d9869903a1c8ea369336730985da46ee32d622814c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.32.1/pup_0.32.1_Linux_arm64.tar.gz"
      sha256 "0138cee23d4c4031441037596fffd3bd6e30e9037d1f9ce25d44f1e0c8ff9cdd"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.32.1/pup_0.32.1_Linux_x86_64.tar.gz"
      sha256 "ee3060e22bde76614ebd02b02db5ad3389f9729c8d480c2efe24dc2978f3a229"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog APIs", shell_output("#{bin}/pup --help")
  end
end
