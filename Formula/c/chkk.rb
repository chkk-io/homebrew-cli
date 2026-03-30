class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.20"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ed5d2bdc13b198973f828892ed1f3bcc2396767119978f9cd3e40f5b4211dafe"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "84afd5fc9fcdeda5e28b96d91c64ff0078471c8df663acd216e4717da96dbcbf"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "44573ed7c7e85f7b4c039eb6b0338c2dac5abf8f0dc31061d6db3151e58fa380"
    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "23cdddf831e0e99f59ac1ae1ee5b5ee1dc137a2e347cee03eae82a94dbf1af9e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "6c8ccae8467a0d5e73e817030ad65d55870f154ba8fcb6be9ef5d390d747b9b7"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "2e5c12753f2d99276b4a819d51763da865a90bdee7baceb202c06b92f583a900"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
