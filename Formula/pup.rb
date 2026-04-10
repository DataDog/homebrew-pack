# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.48.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.1/pup_0.48.1_Darwin_arm64.tar.gz"
      sha256 "82a47003c6f8b35bc9c9245ff0d231acfc8ebc21562fc1a9b71dba131830b87d"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.1/pup_0.48.1_Darwin_x86_64.tar.gz"
      sha256 "e7d7e4cc1d15bd2646c72a47ff544885508ede80b3ecef16f01c049264dd6fa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.1/pup_0.48.1_Linux_arm64.tar.gz"
      sha256 "d32f80f171a046d8c4459c7a8cddd1112f5683e45de1697e5a680688108cb39e"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.48.1/pup_0.48.1_Linux_x86_64.tar.gz"
      sha256 "2ba246f84394e6cf0c242e27cb6fd1b916eaed8e9295b9bce3371adad2ae0c7a"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog API CLI", shell_output("#{bin}/pup --help")
  end
end
