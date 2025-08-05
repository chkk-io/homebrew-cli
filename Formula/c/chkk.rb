class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.2"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "212575478c8fc896e2abd409184fe4598d966822ed5a406ba73b1fee8a0ee74a"
    sha256 cellar: :any_skip_relocation, ventura:       "24fa9e7f4ac607e24778f79d656e2befd68e04f820678e6705daa3f659c6bb32"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "795d8d5c05f204fb718f29ed59f9d122eeed9637147a0e4de4907371675d69ff"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "a07beae5ae3ce22bec5d50b73cc0630c60803b52f7ce18858889c3b1b3278fac"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "d74f20f00514fac89c6b703ec6c7286a0acfa58b812f12cc589ccec5e2c58642"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "35fd09c26e44391d13d81c47c05182e29c2ddf1d4bd0b1ffa708f21716459a9b"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "db4150a57d88bf15f0c2b5f51aa9ed06e73076e076460f7b22989b16a5ce5390"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
