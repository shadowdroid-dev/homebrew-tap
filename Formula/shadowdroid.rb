class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.3/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "c9e639ee16d81dc8451ac185f215bfc8341856e11076fd6107c8f1ae84069772"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.3/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "ce113e5b4adc02559f5ba6f0a094aba81287e7048bcf04c5a0d6717297811d3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.3/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5fbbb3e08be4ce0c4b59a203d17129bacea7ee416b11f59e444ef535abd16b9d"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.3/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76a460cdf2040fad6a9597767b1aacdec4b3d5131e1c965cf30f17792b9458b1"
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
