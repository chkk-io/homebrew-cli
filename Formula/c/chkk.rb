class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.14"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "73231bf49b4a150fd0903d5ec3cea7018fc0e5f11fc60bcd23c1d119fb347a9f"
    sha256 cellar: :any_skip_relocation, ventura:       "373124ef18751a5dc9a8f475c8aa1769d60ead0c3e25379cc9006f877ecde3ca"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "905aed6d9032d06ee708b682f86dcef5dd422bab63dd130700d278bbcaeafb9b"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "176089a610dbb349a5f34d4753f192f7f52c14a7e9bf4e8af92ca52e84ed6ec5"
    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "aad9121d8741eee20eafead092efa3b3ebcefacff7c9dd1d97122c139b88da14"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "c30230e1434c85ec79a42a569c402197f3c197257272c537b3bab2a028eace6d"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "708c9c77fbebc7cf832cb683ecfcefcf24ff4da0cec1dde8abc3bc7770c997a4"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
