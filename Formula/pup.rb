# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.36.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.36.2/pup_0.36.2_Darwin_arm64.tar.gz"
      sha256 "a200cb216245acc6d28aae0f95eebcbaa16528c7e192e29b7ea3f6e69c9dfb5b"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.36.2/pup_0.36.2_Darwin_x86_64.tar.gz"
      sha256 "320dea12205fdd9fe826f2d21f70cddc671cb2671f0e1bb150f92d1512505830"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.36.2/pup_0.36.2_Linux_arm64.tar.gz"
      sha256 "151e690172d4a800bef19ab52cd7b5736cd1874b8e06cb53ad0b29c58b0ef3f5"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.36.2/pup_0.36.2_Linux_x86_64.tar.gz"
      sha256 "2707ee804062eadc71ff678de0c4285a7b3136f0f18263868a3c77b8ee671c72"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
