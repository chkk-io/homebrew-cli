class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.9"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c556669a4e388384d016d1a3c5fc620b85d27d8eec07a833573202d16f45d939"
    sha256 cellar: :any_skip_relocation, ventura:       "516b8cfdec3d25efe31a8d2f36f7fd38d49188203e7525039ca69425ec36727c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "52a2d39ffb77446d51de1db293aae51edcaa972280b8fb2644b6bbb686044dd0"
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
