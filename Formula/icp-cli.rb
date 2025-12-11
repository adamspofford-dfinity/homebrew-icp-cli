class IcpCli < Formula
  desc "CLI tool for developing and deploying application on the Internet Computer Protocol (ICP)"
  homepage "https://github.com/dfinity/icp-cli"
  version "v0.1.0-prereleaseBeta.1"
  license "Apache-2.0"

  depends_on "icp-cli-network-launcher"

  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/#{version}/icp-cli-#{version}-aarch64-darwin.tar.gz"
      sha256 "c059b227b254f6cc00bc54e2794190def80f0c56a0a7efa29124e984701e3f7a"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/#{version}/icp-cli-#{version}-x86_64-darwin.tar.gz"
      sha256 "228edd97e6135ec417de9e2491ed0e69076f5cafec3a402957ffa40feba60dfb"
    end
  end

  def install
    libexec.install "icp"
    icp_env = {
      ICP_CLI_NETWORK_LAUNCHER_PATH: "${ICP_CLI_NETWORK_LAUNCHER_PATH:-#{Formula["icp-cli-network-launcher"].opt_bin}}",
    }
    (bin/"icp").write_env_script libexec/"icp", icp_env
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
