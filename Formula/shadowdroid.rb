class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.5/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "4d2a8e5fd8dbaa10bf1a19253db1db8eff5e167bd3ccf7089ff194e79692add6"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.5/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "60dd5926287f42f35c410d48e3c9c532688df7b2ff88dbebd141f1d0dc1d0a12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.5/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a11b5c142a6feaf6a3730bf8190d4742e8a374636c4a2e05771aa63cf606f8cb"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.5/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2998635f8acb8f4190e649c5784a8a818a9653d000a10c0d9690ae0251f2322b"
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
