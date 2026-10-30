class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.0.1/olef-aarch64-apple-darwin.tar.gz"
      sha256 "7b39d8aa272c78a7d6863af7debf47859674fffcc1cedc21e5111adb80f818aa"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.0.1/olef-x86_64-apple-darwin.tar.gz"
      sha256 "dde3990fdfcf713fc35126e97aab2d9cc82e9adeb0656d1ac6495565e8424493"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.0.1/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f2a9c39013e4bfd41f9b3f9ab2c788b20edcb872d0a4b92ea067d7cf4052a0c"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.0.1/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b58bbefe3a9d81fc6c76b0b99586b52cccff55718067a8b7eb3ba9ee8b780d71"
    end
  end

  def install
    bin.install "olef"
    # The pre-rename command; v2 scripts keep working.
    bin.install_symlink "olef" => "shadowdroid"
    prefix.install "LICENSE.md" if File.exist?("LICENSE.md")
    prefix.install "THIRD-PARTY-NOTICES.txt" if File.exist?("THIRD-PARTY-NOTICES.txt")
  end

  test do
    assert_match "olef #{version}", shell_output("#{bin}/olef --version")
  end
end
