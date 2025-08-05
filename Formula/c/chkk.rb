class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.3"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "62eafa2a814b961a530cd90043901e50129c03684db59a5c34865386b5a81314"
    sha256 cellar: :any_skip_relocation, ventura:       "3703ddf543c489396ed19c1e6f69b86122523350a1bcc42433b4c5d847473345"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7b4e92924ce0beceb4d83e7b6985444c89fb9d64b02aa41ce8510c50964efd9d"
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
