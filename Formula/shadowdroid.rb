class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.8/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "239d874fdb998a43702a9472063b2cc56424f8f6f07303c0d833f93cffedbfe2"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.8/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "20b6e0ccbe758da7423a3f5a8a4b2bbacf69dac05a4b3c94412fe74f14dab767"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.8/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "344384d7818f5da00f91f968f21f16f167654e001139ce0eeca6d7e95de4bad8"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.8/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c127f5352b319a3268b7b014439cd447608164827e456222e7679decb16214d9"
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
