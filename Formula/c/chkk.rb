class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.12"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7727858c0770dca7ecb2fd59542ef3b3eee646c94778737d8a404e0e585c8d9b"
    sha256 cellar: :any_skip_relocation, ventura:       "90a117cbf073c3b6cc7e6eb0b6b7fb22ac673884674368feaba7c5b4befaff76"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "38fc430ab6b8f5e13a1706f9ed57ca287b1e484251f8ec0e7b65b2350a4379e3"
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
