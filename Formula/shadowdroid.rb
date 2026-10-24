class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.2/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "9bb4d9fdfc621f13f0f63a0e9b12edb4a5736b872165639748bf61cde72a761d"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.2/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "9a48f578c6b7cc07ff027742a6b35fb71ef369280167b37d67799cedcd4b9c65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.2/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b33111b2dbe1ff434a163c342faacc94a92e01b924daa33908bc5d75292aaa3c"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.6.2/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79285a35833bd87d8357aaa436a64a2614a6c7fcd6eb5aa30a5e04469cb6af3c"
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
