class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://github.com/andriyo/ShadowDroid"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.2.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "57c9e9615ae201bbfe26140e3aba4bb75741109cdffa6db8da87d878c6e40713"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.2.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "93d78c562626d28a081ba21e9b29e3a38fec0845a2d3dea78d46bb2324677a5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.2.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "106369a241cb9663d548c6fd72201d655b05f01f923d54f55c091abc8e0bb242"
    else
      url "https://github.com/andriyo/ShadowDroid/releases/download/v1.2.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3456795b4277fdbda1488bd7075d00bd926664dd007a49d27c2b20723317c982"
    end
  end

  def install
    bin.install "shadowdroid"
  end

  test do
    assert_match "shadowdroid #{version}", shell_output("#{bin}/shadowdroid --version")
  end
end
