class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.15"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2778547b3d41174c3e55791635c2758a344517e204ea4c7d177c96ccb8e0ed1a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e80e1088f07544967b78d5a1da820c69644f630175a898003059859d7aef9d1e"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "9467dd260e19bf64b56f04f0e96e8b46d60e00d977a04a18a754e298d8479aa6"
    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "db2386a0f4f9110ed84d7f90b6c149b9c7f7e10fa1333f5c991eed1f53a56853"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "eee0321797ffd58b1bdb1544f8181e856b185df8f3ec385031d39c6211cdab13"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "881cd257a187286345085d8116735525f362594edfd602ed0d546b46a6275111"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
