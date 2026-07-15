# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "1.6.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.4/pup_1.6.4_Darwin_arm64.tar.gz"
      sha256 "0e1e36c0866c3b19364976ebd8c3a258e6287431a0076566a978342bc503c285"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.4/pup_1.6.4_Darwin_x86_64.tar.gz"
      sha256 "f14a4fd360453db3eede62398eb8a8479b2f816aea5a16f6d57a23f69cca7f94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.4/pup_1.6.4_Linux_arm64.tar.gz"
      sha256 "9175e14667269927aa2409d7087e7f08f720d1de36a4999ea5933ba36da4da0d"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v1.6.4/pup_1.6.4_Linux_x86_64.tar.gz"
      sha256 "c639cc80b358d39e8cf201f66a0f1ec5b99fb453bb896f1327cba463913e1b95"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
