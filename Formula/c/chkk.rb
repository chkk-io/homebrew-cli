class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.18"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1566a78167b32934c40fb7dd263ffbe256e3b7000f8af2a21049194cd3836485"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "42cd2cd09270bbe20c430c6f56b4a8e00ad172748c9080583ab801e91bcfd705"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "87c3fd906561bb37cc6b444c6d7d7b6e676d7710a75d4ff170fcfcbe1a5cc4ce"
    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "ab7d1000cfc1d18256b2341679a8fca256af73fd7eaface5eb080b74a500a6f6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "7ba0dd103df3e179b580332db18cf24353ec20b697b303c2ed60e5dec72c0a0b"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "305314798f577f741173a0d9b83796dde664c459ee0259d331b38ef7bb6a6aa3"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
