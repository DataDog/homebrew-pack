class DatadogCodeSecurityMcp < Formula
  desc "Local code security scanning for AI coding assistants"
  homepage "https://github.com/datadog-labs/datadog-code-security-mcp"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/datadog-code-security-mcp/releases/download/v0.3.0/datadog-code-security-mcp-darwin-arm64.tar.gz"
      sha256 "011bdd8c3f36b2b454015beb1a8a8968766a2a7ea0077d2085ff591cfcc4e847"
    else
      url "https://github.com/datadog-labs/datadog-code-security-mcp/releases/download/v0.3.0/datadog-code-security-mcp-darwin-amd64.tar.gz"
      sha256 "19c2aeae3fcadbd0cb232ffb5715f9f5d00beff4e5ec316eafbaf7a097b56022"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/datadog-code-security-mcp/releases/download/v0.3.0/datadog-code-security-mcp-linux-arm64.tar.gz"
      sha256 "d931511aa64a63c69bd7d54925c0707655d0c7102b1c96990eb9f90b3d6e1ca9"
    else
      url "https://github.com/datadog-labs/datadog-code-security-mcp/releases/download/v0.3.0/datadog-code-security-mcp-linux-amd64.tar.gz"
      sha256 "e6b583a0e6e59c34fe4db1e1d665da9f833d5eed049e8eb71f4628226482fe4d"
    end
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
