class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.14"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2778547b3d41174c3e55791635c2758a344517e204ea4c7d177c96ccb8e0ed1a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e80e1088f07544967b78d5a1da820c69644f630175a898003059859d7aef9d1e"
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
