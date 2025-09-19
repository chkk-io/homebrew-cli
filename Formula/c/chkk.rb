class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.8"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7aeb2f200cd6389f1442944d03f8a3e9e12ce7dab055cb0dfa03dfc875e0fef6"
    sha256 cellar: :any_skip_relocation, ventura:       "22fdb15ee7a5a995964c1c5189f632e1200128dfd6f976412ec1a620d6aad29d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ed07e0aa033695003a75d006997f372223bc032a456db69f797c51b9e60db59c"
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
