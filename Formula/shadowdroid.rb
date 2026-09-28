class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://github.com/andriyo/ShadowDroid"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.3.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "ca57a1bfd6538184154232af2a919a924265e2aa9f1dd1f9fe5ac7bc6abba51d"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.3.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "9b2d0334a57bc630766cddfc6c08cc2cddf9190cfd278409394a97b560d9429f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.3.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "907368b94c307e22dc9a7d1e24fc58357d728e5b7e494a11ace77d32ae6535da"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.3.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "542e8a56f4aee7f9c5ca2a06e5dab85a5848bff32139843c7611973ee3f7ba2d"
    end
  end

  def install
    bin.install "shadowdroid"
  end

  test do
    assert_match "shadowdroid #{version}", shell_output("#{bin}/shadowdroid --version")
  end
end
