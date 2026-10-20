class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.2.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "3fdf9b9c3ba4410ae555a0f4d360564dc64c57c37109f5e0606f40590797fc06"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.2.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "b6ea57cb6704fa5977709468773ad9e10ccbd03b2c7560b82c832f451027dfe0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.2.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3fc250d8a81c107e76ba6c2ce77a7d3d20ac9204c81a085463072b4296f883d"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.2.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b50501596e8c52658b98fa3b6a34a90e598f02bf71fadd90df66d7730072560"
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
