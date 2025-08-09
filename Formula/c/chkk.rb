class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.5"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "49288b67953aec2646b865c19906679853ce426dc76002200cca00a6720eb079"
    sha256 cellar: :any_skip_relocation, ventura:       "7c27c19c22682e629f5165bb33cc8d511cebed5b145ec25657f3f42320497d58"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fe2e4eaeeb64bba149c1b30a0859fe08ede4ffe6a644394e4f4b795238dce5b1"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "2cd0ca387d752dc399bb623a74dd10b4736b25aa615bf167fb6799ab96576465"

    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "875d5951a4c29863d53ee4826b74f53d6e463f51b2c5d9ff84d8999606245c08"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "b5057d15ebeca006cd335f63cfe232a20fe481dd5c3d199888ce51995c9f8b85"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "a3cdd86bf50739218e52a9031361b909d6e67bc7532a5ba28c45d12714d2901a"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
