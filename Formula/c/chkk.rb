class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.6"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "589532750e40b64b35e0c9a9d65b5230c28441e9caec77ec9206cf25117f9b06"
    sha256 cellar: :any_skip_relocation, ventura:       "f5778dc541e591c975b57b24875c572b7fd88f5e0ca261deef7f0418c0391ed5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "de3ed4f211490f55b30d36a8f15b4fd080d31ce07e1d83e46691013bbe94daca"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "bfe9116fbe82cc2cf233644b7ce1642c13a265c25b44958bfbd9b8e2b93c78b7"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "a5393156715f78c76c666208c136f6f5a360ae0a2ba091c8e9e9958a6dbc11d4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "7600b5f8a2d704ea3e9dcbc2fa689ffa10022ee722b47e657af195b5ba373d8f"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "b2959d93f2adaba88224288a9c6c75210b5623805f38da66286a4108822eccc9"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
