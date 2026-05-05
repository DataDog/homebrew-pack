# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.57.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.57.0/pup_0.57.0_Darwin_arm64.tar.gz"
      sha256 "3547e1c1c56c2f1352068c469314f4dd773dc082c45673579c543ff9fd2bc988"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.57.0/pup_0.57.0_Darwin_x86_64.tar.gz"
      sha256 "edd92dce58fbeaf0e244ded4f4edb1f8ff371ad9d43278c11b1329e0524b33b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.57.0/pup_0.57.0_Linux_arm64.tar.gz"
      sha256 "02daae0641912b5c6683b440fd978e62e5b4c223974cdb99516ba07844285220"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.57.0/pup_0.57.0_Linux_x86_64.tar.gz"
      sha256 "df8efc7dd1a2bb8e42553b268ab92ea152bf38a0f47e65814ea9e9ab984c19de"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
