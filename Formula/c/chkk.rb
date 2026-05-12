class Chkk < Formula
  desc "Your Upgrade Copilot for k8s, Add-ons, Application services & 100s of Projects"
  homepage "https://chkk.io"
  version "0.0.22"

  bottle do
    root_url "https://ghcr.io/v2/chkk-io/cli"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cdc7af03253b30dd621429290ae5367c62441733a867c96b1097bf67b950b9ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "dc67ba38820077af0858a25672e79498e538bfa9257a4b3966fb8ed2d62089bc"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-arm64"
      sha256 "d38b72083e2b63dd893d923a2e542160618469af1aea9fca08449836f731e7ed"
    end

    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-darwin-amd64"
      sha256 "1f5eaf3acd365d66d4015a52f2effb3504103b31c5b3ccc609c74d6b2b2612ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-amd64"
      sha256 "5bde0bc4631f37d6cb5cf99f7b052245c5a313db1917c4d5baa490779531625b"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.chkk.io/download/v#{version}/chkk-linux-arm64"
      sha256 "a9bbea3bc2d7610248e0ee2db1eea0206aa18ca4c9fc7f4630263c389d658f48"
    end
  end

  def install
    bin.install "chkk-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "chkk"
  end
end
