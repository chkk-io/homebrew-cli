class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.10"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c556669a4e388384d016d1a3c5fc620b85d27d8eec07a833573202d16f45d939"
    sha256 cellar: :any_skip_relocation, ventura:       "516b8cfdec3d25efe31a8d2f36f7fd38d49188203e7525039ca69425ec36727c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "52a2d39ffb77446d51de1db293aae51edcaa972280b8fb2644b6bbb686044dd0"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "6a0e8aaa065c338dd2ec119e8b874018729c5b159d2bafe97bafc754bfd692ed"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "18b8cf7d74886bd3f194b2b331aedf73adb80a31847584b52dddf3ecdc7163a9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "ca443081156dead79d9ce0ad998b2b1993e85d907dee78e6c25be3e37fd5b8e8"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "36ea35544a6fc61ceb87bc8e2e06a5da997aed2311d82e37457277fad8766f73"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
