class BitnamiAlternativesFinder < Formula
  desc "Find Bitnami images in your infrastructure that are at risk of disappearing"
  homepage "https://github.com/chkk-io/bitnami-alternatives-finder"
  version "0.0.1-alpha.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chkk-io/bitnami-alternatives-finder/releases/download/v#{version}/bitnami-alternatives-finder-darwin-arm64"
      sha256 "6b3c9e0fd6952b9be9d78ed1519b74ac14da94dc24f5eeb7acf625e049d142d8"

    end

    if Hardware::CPU.intel?
      url "https://github.com/chkk-io/bitnami-alternatives-finder/releases/download/v#{version}/bitnami-alternatives-finder-darwin-amd64"
      sha256 "cc502a21ec207972a99330762c3d9576d6c0427e06930ec4513ac0f4b4d56fef"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/chkk-io/bitnami-alternatives-finder/releases/download/v#{version}/bitnami-alternatives-finder-linux-amd64"
      sha256 "208aac5cff964bf59023170f8b0d6ca696f2502e9d6d626f98fd06be645ee6c0"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/chkk-io/bitnami-alternatives-finder/releases/download/v#{version}/bitnami-alternatives-finder-linux-arm64"
      sha256 "aa4b9b80530e342f3f7890491d216b6e388be28852987a684af993f5389c03fc"
    end
  end

  def install
    remote_filename_os = OS.mac? ? "darwin" : "linux"
    remote_filename_arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    remote_filename = "bitnami-alternatives-finder-#{remote_filename_os}-#{remote_filename_arch}"
    bin.install remote_filename => "bitnami-alternatives-finder"
  end
end
