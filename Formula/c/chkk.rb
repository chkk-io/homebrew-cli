class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.3"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "212575478c8fc896e2abd409184fe4598d966822ed5a406ba73b1fee8a0ee74a"
    sha256 cellar: :any_skip_relocation, ventura:       "24fa9e7f4ac607e24778f79d656e2befd68e04f820678e6705daa3f659c6bb32"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "795d8d5c05f204fb718f29ed59f9d122eeed9637147a0e4de4907371675d69ff"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "274933fc3ce7138988aa4ba5da32771f55c720a0df53bf67ccaf75f1e75112f9"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "f028bb40419dd83da8b08bc94e61a24cf3e0acf7463d76a6d4dfb5429a7d1286"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "4bdd1d8a65f582d6c41b732f958bbfa3615c9ff861610e682722e0d637915933"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "7395aa0ac086a8aeda24617468dedbaed24ae59b1074f619291a80f9f4124ecd"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
