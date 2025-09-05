class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.7"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c21bf6cba9e5b06df220451af5a5bc6ceb22440087480dc80a61ab69f5703964"
    sha256 cellar: :any_skip_relocation, ventura:       "d18834a139d2373561e703db032ea55028c48d822a7f44de4756b538fa3bd910"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bd7f5ad5f8f612cdf663412816ccf083f5a70319ff73c1028717a50859a57e81"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "6ee03e572f60ce9fa757094c121438588e275c2faeb566090a695c353acc74e8"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "6ffd23792390dc97f4ebf981b5f6a8fab4962f2c7dc39069bcf8f258bc84ce97"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "75c75904331bdcb6261359ed1f731babdecbdd614fd6472e9502f706a688609f"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "353ecffbda580420434f59aa75ffea515bebdc4c937c3db83bf9cb2787a3171d"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
