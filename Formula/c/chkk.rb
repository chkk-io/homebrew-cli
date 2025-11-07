class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.11"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c1989b183f85d8bdb709b8a58626f3a7d65be5f8c357049decd0e311f8956e3c"
    sha256 cellar: :any_skip_relocation, ventura:       "317cd653e569b512c5519461f67f9e6feb8cfe34eb1bf90c8ccd3b70d63f25e4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "34e5231c8dc77e51dc094763bb149ec51c855cab6d29fe35f65a05e3f592d7c8"
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
