class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.0.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "2793992ee2187e1ccf39bbec8bbeba65de58cc6be454d90e3fd12af98c6b1862"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.0.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "719df1e76d25093f5848b1fcdacb832456a79c0428a4b615c5f4021e4a907692"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.0.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6c577dec72f5d2858f3f7c10e3eddf4b75a2b5ca3675d95341edd02a7e5f232"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.0.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c6141477a89d20aaf4520caf11118bea27597c66df3244659aea896283ee9c3"
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
