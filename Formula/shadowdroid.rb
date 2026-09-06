class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://github.com/andriyo/ShadowDroid"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.1.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "97c6d8b838d807c3c2bb585cbcf576b1339811355ea3abd014cd5ecdd8e6590d"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.1.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "f450ca6d758a84685770d5484d42d297f968da951876279031e4d83d2f85553a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.1.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b95d52d22220281c2b665874f81191bf029b08fbdd768362cb1ab5e5a14b103"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.1.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a025a796201977c3efd7123ff78046dc0e2b7db40ef2e5b02347d97fc4109ee5"
    end
  end

  def install
    bin.install "shadowdroid"
  end

  test do
    assert_match "shadowdroid #{version}", shell_output("#{bin}/shadowdroid --version")
  end
end
