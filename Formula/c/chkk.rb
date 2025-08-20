class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.5"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "589532750e40b64b35e0c9a9d65b5230c28441e9caec77ec9206cf25117f9b06"
    sha256 cellar: :any_skip_relocation, ventura:       "f5778dc541e591c975b57b24875c572b7fd88f5e0ca261deef7f0418c0391ed5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "de3ed4f211490f55b30d36a8f15b4fd080d31ce07e1d83e46691013bbe94daca"
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
