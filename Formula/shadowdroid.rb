class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://github.com/andriyo/ShadowDroid"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.0.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "0e24e050e70433b7586b2368a3d38bc3ed05c795246a11cf9eb741659c7cfa3e"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.0.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "6dc50a93a5865294efa252b8bd035e037e0ca570228274cab477b4916182a88d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.0.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "52d4fd71a2fa1f3f7ec2bc740adf6ea5c8c35d320b2f3b5d7ef79ed4d98ec3ef"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.0.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf602d8a26d9d4c24e4a0263e737b35fad86088f4ffbe6a89ea7a3c41329bb25"
    end
  end

  def install
    bin.install "shadowdroid"
  end

  test do
    assert_match "shadowdroid #{version}", shell_output("#{bin}/shadowdroid --version")
  end
end
