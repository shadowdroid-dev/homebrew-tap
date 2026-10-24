class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "b12529f63f95267c43b265b421aebbc6c907ab4e2fac1a45cf44a7bc62750960"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "d80fdd7e29f85a6fffc0cd46b5f963e20a917fc234d20c600649893d93b38650"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57ac3b1ba07d196b6541936cd72e7b0376e9b4374c38d3dffc1aea1eab6d4e3d"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cbb5518b25c0a6213aabf786dbf6f994e0e48615a0f111f4dc0c603a83a07a4c"
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
