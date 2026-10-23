class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.4.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "7830d5d9936a7e43a5f696b80d3109f3178b6c556396dca69e1ad7fae129a1ae"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.4.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "03ba7404d6446446c15aae376df732e8877df8a77d5b4d573c659178a68987dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.4.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "05e96a8e8882f4173f522a1a6150541625a59e3cbb35ad19722b7feddc71a9c8"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.4.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e838016c9d52fe72dafe78d863a45aabcf240e75a2aa998371a6b1e65c32cb3"
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
