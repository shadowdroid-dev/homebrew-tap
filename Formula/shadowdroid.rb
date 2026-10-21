class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.3.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "45bd1215654e2c625d4177bdfbe96449daf31c4353769f8305b24fa0fae53a9d"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.3.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "ea04ff10016960b516bab0c9229d37a83e1685cf9d6e93bc990a3e0e7a810c6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.3.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fdc614122f7893729a3caa1429966f418b43864bcb304114a624889c04ab44e6"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.3.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1355db1399efdae8565a869c9562c8e3aeeca4bce7798401061684c5ee91df6d"
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
