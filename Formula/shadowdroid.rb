class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.2/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "1e3ab5830c170263d2bf865597af31c953b28c5761cb05f64db8f1437049e5f7"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.2/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "3fd935872b0362d51597fb4603f9c1a1b10f2803d156fa017e9e583a20a188f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.2/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e375097b126d07e13adc62be7b009e15f80a33d9dc1b3ad2478a0429c29c78f"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.2/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d985505024aec4b63238dc4e2f126a11d8c1e0908429b205ed8ab287900f877"
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
