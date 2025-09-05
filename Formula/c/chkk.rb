class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.7"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f56f7d12483cd3c4afd75521dde05f8ab2f094e66fc3c0cffce4b259112e27d5"
    sha256 cellar: :any_skip_relocation, ventura:       "b1015947424e5c61948e898a9fd4eb8776601380de32574be61f945011cb3b95"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "853f1a3bbf5ab44297538e7eb0c82e01ae94d637fb80c61b9e92ca450f2ecd1d"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "6ee03e572f60ce9fa757094c121438588e275c2faeb566090a695c353acc74e8"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "6ffd23792390dc97f4ebf981b5f6a8fab4962f2c7dc39069bcf8f258bc84ce97"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "75c75904331bdcb6261359ed1f731babdecbdd614fd6472e9502f706a688609f"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "353ecffbda580420434f59aa75ffea515bebdc4c937c3db83bf9cb2787a3171d"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
