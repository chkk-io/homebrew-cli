class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.9"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7aeb2f200cd6389f1442944d03f8a3e9e12ce7dab055cb0dfa03dfc875e0fef6"
    sha256 cellar: :any_skip_relocation, ventura:       "22fdb15ee7a5a995964c1c5189f632e1200128dfd6f976412ec1a620d6aad29d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ed07e0aa033695003a75d006997f372223bc032a456db69f797c51b9e60db59c"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "614df96fc50efd6e394f186b69fd50296d3d60782fb42a52477b4b7eb8a73825"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "bbc2e6f3fe5294149cb0a233879938d98b906b0930dc5024d0fd9a81faf62e45"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "9e80ae5fda498b1e480927825237a1026b9fcc7e26c776f8262afe840ab10078"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "391974259d10205e67bf23c0e9d8f85ec1831292d9628a862f9f9ec75b77fe87"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
