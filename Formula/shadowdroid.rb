class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.4/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "3aae9cf945012fc73e74ead993f45b5618cbb54d4d4378c6d154591d032e8cef"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.4/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "187b647f58777131c514faeca43b1fc8b0a4dd624a12e165704031ff8257f161"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.4/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "400975d99e9049be57f32e1ed0c771b5ec55c3e29e38526294d3caa5222543ae"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.4/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba8410000267fc694e3e8041aa6157b8a817a7928ab5707365956aa5cdd33d26"
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
