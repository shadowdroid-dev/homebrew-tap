class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://github.com/andriyo/ShadowDroid"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v0.16.1/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "825cd7ad3115124bce265474034000a2eb01ce2ffa59869a55f9787dfd8e485c"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v0.16.1/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "9f8644d3a965e2d48a9307164617f4860b875825c3813ceb805e1db45586c11d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v0.16.1/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25082240e4677164693f69e2031863c13fafff934e5457f5b282dfcba2fbec59"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v0.16.1/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19ad2c37371edd53e99dcdee1e12080a51d6b0b83d8111b3a86246765cc073c4"
    end
  end

  def install
    bin.install "shadowdroid"
  end

  test do
    assert_match "shadowdroid #{version}", shell_output("#{bin}/shadowdroid --version")
  end
end
