class Nbor < Formula
  desc "TUI tool for discovering network neighbors via CDP and LLDP"
  homepage "https://github.com/tonhe/nbor"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tonhe/nbor/releases/download/v#{version}/nbor_#{version}_darwin_arm64.tar.gz"
      sha256 "51e7d0259e7fdcd5e469dd0dfd45910be85f61133104a4589d43cb28af708ada"
    elsif Hardware::CPU.intel?
      url "https://github.com/tonhe/nbor/releases/download/v#{version}/nbor_#{version}_darwin_amd64.tar.gz"
      sha256 "7365208e1135784c94dd31cef87643f70ca18d3d766f771a5c72b414b97026f7"
    end
  end

  def install
    bin.install "nbor"
  end

  def caveats
    <<~EOS
      nbor requires root privileges for packet capture.
      Run with: sudo nbor

      If macOS kills the binary on first run, remove the quarantine flag:
        sudo xattr -d com.apple.quarantine #{bin}/nbor
    EOS
  end

  test do
    assert_match "nbor version", shell_output("#{bin}/nbor --version")
  end
end
