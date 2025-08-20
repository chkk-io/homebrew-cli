class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.6"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c21bf6cba9e5b06df220451af5a5bc6ceb22440087480dc80a61ab69f5703964"
    sha256 cellar: :any_skip_relocation, ventura:       "d18834a139d2373561e703db032ea55028c48d822a7f44de4756b538fa3bd910"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bd7f5ad5f8f612cdf663412816ccf083f5a70319ff73c1028717a50859a57e81"
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
