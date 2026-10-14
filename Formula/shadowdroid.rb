class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.6/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "09bafd4f6781e3883d183041f2f242c4384c61774414914585cbb189e42015ed"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.6/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "7827ece0c5331132101371a84e2e8680291e3301bd5f2d07556ebb8dd858a0b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.6/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "542fda95774a526e30e05ae4b375728a74e4a74e41df1667df1b2b26c45da38d"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.6/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6d23d1a8cfe804b4908ee1fd94e7a76eb9994b60ce7c23b26b15efbbb796c26"
    end
  end

  def install
    bin.install "shadowdroid"
    prefix.install "LICENSE.md" if File.exist?("LICENSE.md")
    prefix.install "THIRD-PARTY-NOTICES.txt" if File.exist?("THIRD-PARTY-NOTICES.txt")
  end

  test do
    assert_match "shadowdroid #{version}", shell_output("#{bin}/shadowdroid --version")
  end
end
