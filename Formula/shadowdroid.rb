class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.1/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "00c623191e299a9c973d9c4d09cf42a988741f795ad26c9a28a9d12cd13fa421"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.1/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "6e1099721ad4d64f01b09ad47e65f19ac8d164b09970423d0d14e0a4419bc816"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.1/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "643c1d1357df6c812b54ef1c90dc5a68fdf8f72fbb2583eb6f05bb1247ab1d03"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.1/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4aaee958f686aa2fcb367aa7ddf89ddcd665b796a05af87e13b9592d04b30b6"
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
