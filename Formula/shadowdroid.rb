class Shadowdroid < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://shadowdroid.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.0/shadowdroid-aarch64-apple-darwin.tar.gz"
      sha256 "0c46d83d1fd5ae0209f89e353e2ba47a24a7043cb347649064897371ab8e6c36"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.0/shadowdroid-x86_64-apple-darwin.tar.gz"
      sha256 "81842f611b43fe2b27216f2059e5529b18e9ec37c60b3474e4366137a3377061"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.0/shadowdroid-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a830da4d3d9817236305ab087e71e648050d4b3f43e9f612d437a6295652a70"
    else
      url "https://github.com/shadowdroid-dev/shadowdroid/releases/download/v2.7.0/shadowdroid-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a7ce1297152c571fab8c0d11898178f6e954f13167f420f6747f28d338364aa0"
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
