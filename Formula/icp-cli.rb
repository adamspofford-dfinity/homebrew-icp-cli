class IcpCli < Formula
  desc "CLI tool for developing and deploying application on the Internet Computer Protocol (ICP)"
  homepage "https://github.com/dfinity/icp-cli"
  version "v0.1.0-beta.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/#{version}/icp-cli-#{version}-aarch64-darwin.tar.gz"
      sha256 "dd6819d126c205d009de9ae2cc8a386810e7241af5bc000b687e5a357f535906"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/#{version}/icp-cli-#{version}-x86_64-darwin.tar.gz"
      sha256 "c4901c92a6faa423aa95acbd9c05ceaf2d51abbf3f47b527f4bd151398a30bb2"
    end
  end

  def install
    bin.install "icp"
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
