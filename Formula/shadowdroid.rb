class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.4/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "2d6161d0bad8f041a111b9c428c26bd87ed9bbe27128f77e632481638c609bf1"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.4/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "a2f7763fed8169aaa6ce19be433282791657f0909534126f9d8f4757b7e39180"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.4/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a1d7112f699eb9de2934850ebe589f6547c9f20ae921b9828b8edc85f942ecf"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.4/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f0ba8b3214859fd9eda634363f80fcdb7491fb01c68d9333f678f5a777efa98"
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
