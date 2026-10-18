class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.1.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "714e70b1fc806ef81ea4c88499a96ace8911fa4807ed11ef8e9395a8391ed861"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.1.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "713bde6429a2223de91de4f14a7950cca0ee98c243b1b10ba8b477c6946211da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.1.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c884e265661a8fb53a4d8b4f5793b4c4b84a7f2c9d3480c5da9832489e291f7"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.1.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e59dd72b3ab309156394b46c8e22eeeb4a7ee6331e200cef6df04cbe529191e"
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
