class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.3/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "fa18a51a9f59c8234c86de9a2efbe7c13a35771ead46960c0a271d947cf775ea"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.3/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "8ea39a36e1c366c25542216a153b0b7c1f099ebbdf5983f24a2264e3565bab45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.3/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9747ef7aa198728eafc4995a05809d4421187f5ebc8dfcf881d69ab32c1fdbb2"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.3/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0fb6fadef3171a469b5fdbfbc2d6e4170c03bfbf3ed8c7474ec68e7911890283"
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
