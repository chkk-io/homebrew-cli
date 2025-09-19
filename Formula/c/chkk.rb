class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.8"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f56f7d12483cd3c4afd75521dde05f8ab2f094e66fc3c0cffce4b259112e27d5"
    sha256 cellar: :any_skip_relocation, ventura:       "b1015947424e5c61948e898a9fd4eb8776601380de32574be61f945011cb3b95"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "853f1a3bbf5ab44297538e7eb0c82e01ae94d637fb80c61b9e92ca450f2ecd1d"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "b285959af71d408ecf58d3a31b81e7f1158d87fa3863c0e37403a1bb218c05c0"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "886b05296bcd140fb2bc346e1f8f492ceb6483cf82ebbf2b3ac62db404032ccf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "4adbe7098ffbdaf36733604715ab275379ab6bc84f1ef345883fae1dab47e61d"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "68e6a5f2ce0cd76ad1ce99cc057af67e895ec3e00a358c04793e6c748a172e61"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
