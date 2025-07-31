class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.1"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cb71aa29501d5c9e7fc84c2756fca35ff303364b05ef99b409830b8146b4b32e"
    sha256 cellar: :any_skip_relocation, ventura:       "bd8bb6c82e297f2e66f27cdeb3fe008f9890a91b2f1e1c4229f70f7d5e0c60fa"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "aa6b1a888e1f3101f3a3a66f3b79a5d0a615954ca95d0c304c2f01e4982fbd54"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "4ce1c373c75ef25e4198b79882a8d8f845d0a652bd86b4f30c7e9e33b0693cf1"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "4c75dc09c6ac544549cfa02d346df467e8882e6354bf34541dc57061a8b1730d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "2a5bcee022ae696432943e380250975746c534b5811b0801b62ad350c61aceb9"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "ef819e468de7940fe636c87e9db68d3345b897a618fe81759813e0c1450c454d"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
