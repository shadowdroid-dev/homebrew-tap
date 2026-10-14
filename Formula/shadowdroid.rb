class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.7/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "1d7d03a386b6b401cbc26360ca30191f1205b33d9f67323433125c802b687a07"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.7/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "b72d824572ce2b0d9840e9de3de6da5ebf76072b83ec34909c7fe6e318938244"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.7/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de27f51f92861cb67e713986b6fe9b2b85f263e07a2028ca36e1e1494a369633"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.7/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0fbe3f6f78e3615439bc627f517f9d62ea6f9105c995edbc23708c3e0d9bc7e1"
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
