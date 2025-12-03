class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.12"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "73231bf49b4a150fd0903d5ec3cea7018fc0e5f11fc60bcd23c1d119fb347a9f"
    sha256 cellar: :any_skip_relocation, ventura:       "373124ef18751a5dc9a8f475c8aa1769d60ead0c3e25379cc9006f877ecde3ca"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "905aed6d9032d06ee708b682f86dcef5dd422bab63dd130700d278bbcaeafb9b"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "0e4dc859eb43af81389dcd8db72d7fbaa078e8ff9bc593156f25a5bb0174a968"
    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "7ee457b43fdf27f892bf499416b8656357434eff4ca689745ea5c77813e571f1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "da471f95556f6257db7c80c26ba7986e70aefd66ddf885318cc41c2480347f5d"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "598ac2429c4adf05649bd8e0d00ee2d64f8d4412a3ddd3ed995562b64d4bd728"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
