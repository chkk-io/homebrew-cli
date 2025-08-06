class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.4"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "62eafa2a814b961a530cd90043901e50129c03684db59a5c34865386b5a81314"
    sha256 cellar: :any_skip_relocation, ventura:       "3703ddf543c489396ed19c1e6f69b86122523350a1bcc42433b4c5d847473345"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7b4e92924ce0beceb4d83e7b6985444c89fb9d64b02aa41ce8510c50964efd9d"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "cea9825be3525c04fb6075f72275f9fbb502b9f76714706e2727ec9eb16459c9"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "4de32cb8c7a8bf1de4fee20f7e423922c4dbc3fd87f7ab4bb5cc210a1c5b5486"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "acbaed1c01510bd8987aa6a450290d29291fcea3aa6b521bfa8abab2c143fe13"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "66da7f52e3b8f4770900722ce4df74a777ce271658398da095648b82ced15833"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
