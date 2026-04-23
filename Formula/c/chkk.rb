class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.21"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cdc7af03253b30dd621429290ae5367c62441733a867c96b1097bf67b950b9ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "dc67ba38820077af0858a25672e79498e538bfa9257a4b3966fb8ed2d62089bc"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "dd597d157f65bf6168d2409ec26391b3f5133f3cdd39d766bfa4bbb28de03291"
    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "5ee5f69c9c83073d6d32abb4a670808ada0e150aa47038a5de9833e3f183d8e6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "375109438570033b62bd3539805087c831b52c6ccbf29662d4f62d30528f8a4d"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "f4ea3568d6a4a8d51c7ae6a42d294e551e6209c6f3844930bfac09c65731356c"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
