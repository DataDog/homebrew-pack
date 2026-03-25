class DatadogCodeSecurityMcp < Formula
  desc "Local code security scanning for AI coding assistants"
  homepage "https://github.com/datadog-labs/datadog-code-security-mcp"
  license "Apache-2.0"
  version "v0.2.0"

  # SHA256 checksums for each platform/architecture combination
  sha256_map = {
    "darwin" => {
      "amd64" => "0a92822c7e5ecfeadfb6c9514447b82aa5a95ab3ae2777ad65e0e12a9853b2c9",
      "arm64" => "538115a39212c72b76e11d8694f750a59b649c7a23b972749489e9659b056ae0",
    },
    "linux" => {
      "amd64" => "f7dc42a61b966a8d3dcb41490f7ffb21dac284336a3d7c0a2eb2c70e62aeb754",
      "arm64" => "63694ac7cff87dd42046bc275e24d219899e81156181a80d4d00ee689bc7ba41",
    }
  }

  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  on_macos do
    url "https://github.com/datadog-labs/datadog-code-security-mcp/releases/download/#{version}/datadog-code-security-mcp-darwin-#{arch}.tar.gz"
    sha256 sha256_map["darwin"][arch]
  end

  on_linux do
    url "https://github.com/datadog-labs/datadog-code-security-mcp/releases/download/#{version}/datadog-code-security-mcp-linux-#{arch}.tar.gz"
    sha256 sha256_map["linux"][arch]
  end

  def install
    bin.install "datadog-code-security-mcp"
  end

  def caveats
    <<~EOS
      To use with Claude Desktop, add to your MCP config:

        claude mcp add datadog-code-security \\
          -- #{bin}/datadog-code-security-mcp start

      For Datadog employees with dd-auth:

        claude mcp add datadog-code-security \\
          -e DD_AUTH_DOMAIN=app.datadoghq.com \\
          -- #{bin}/datadog-code-security-mcp start

      Or manually configure in ~/.claude/config.json:

        {
          "mcpServers": {
            "datadog-code-security": {
              "command": "#{bin}/datadog-code-security-mcp",
              "args": ["start"]
            }
          }
        }

      Direct scanning (no AI assistant required):

        # Scan current directory
        datadog-code-security-mcp scan all .

        # Scan specific paths
        datadog-code-security-mcp scan sast ./src ./lib

        # JSON output for CI/CD
        datadog-code-security-mcp scan all . --json

      Note: All scanning is performed locally - your code never leaves your machine.
      Authentication is optional and only needed for future cloud features.
    EOS
  end

  test do
    system bin/"datadog-code-security-mcp", "version"
  end
end
