class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.1/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "e1e0e5537675c81748b68d13362a2918ac18894d9e0059e843fa1e05dd60726f"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.1/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "0b8531c47d6038f5cb1b136583e11479c90b11bb20c176975e281770f976a907"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.1/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae127d96e749246a430022a48bc527d2e4d4935a2682405fbf796a44195d349d"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.1/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6db8d851a79c1ce826fae787790abc94d7900d3a74c769caf732128878c44ce"
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
