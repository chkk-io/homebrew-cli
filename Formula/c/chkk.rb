class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.11"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7727858c0770dca7ecb2fd59542ef3b3eee646c94778737d8a404e0e585c8d9b"
    sha256 cellar: :any_skip_relocation, ventura:       "90a117cbf073c3b6cc7e6eb0b6b7fb22ac673884674368feaba7c5b4befaff76"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "38fc430ab6b8f5e13a1706f9ed57ca287b1e484251f8ec0e7b65b2350a4379e3"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "2f9e31ad7099c8e9b9063d981c435b6437960b160b132d6a05e8e2645eadabd8"
    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "aaa26fef25c870ac104e0df5c82393f75ad7e08dd12d24da880c2859fc9bf00e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "1ad424f990c66d19ad3f38e86254e2205db7817365022bf332400f7824eb4469"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "cef4860814aec982e88301c4854bcd465bcff553a27d42f1dbb0cfa75db56fcc"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
