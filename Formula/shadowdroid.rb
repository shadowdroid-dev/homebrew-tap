class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.5.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "ec21f08679a428f72b1a1dfd0555fd96143d9deea07e7896acb9b0d4578bec0e"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.5.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "26d8ad2c1c09a196e8ee7943fd3fe525eb8252162fbfb34aee7d52ca4bdba29b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.5.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab94e2fe0788c7365259b715f55994e49073b8c3972ad6bf946ccae0019ba85a"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.5.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ae215fcbd590aa8a86fa744bc1b08fd044c446d64a0fc786f9e0c968b5a69cf"
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
