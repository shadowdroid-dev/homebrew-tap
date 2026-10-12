class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.3/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "5ecf20fdf3a717aa12f03c679945a97549d21922f02b0ec053e238b7d7bc4f19"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.3/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "090a1f000c2a0f4c6b996f42e1ea14bdd2c0dc8a18137c8bff96fe46ba6ef871"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.3/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "549ce4dd80f89041702ed782df2dba4fbdf9bd2e966cffa6aefe7c9cc155bc53"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.0.3/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8af90d05cde444b918a3387f280db44ccec25400a83c3c2dd64b4df6a18a0dc"
    end
  end

  def install
    bin.install "shadowdroid"
  end

  test do
    assert_match "shadowdroid #{version}", shell_output("#{bin}/shadowdroid --version")
  end
end
