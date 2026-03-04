class Nbor < Formula
  desc "TUI tool for discovering network neighbors via CDP and LLDP"
  homepage "https://github.com/tonhe/nbor"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tonhe/nbor/releases/download/v#{version}/nbor_#{version}_darwin_arm64.tar.gz"
      sha256 "78c9f6de1423f44564c7aff2c7e61946b9106269b812cd777fc35a737ae128ec"
    elsif Hardware::CPU.intel?
      url "https://github.com/tonhe/nbor/releases/download/v#{version}/nbor_#{version}_darwin_amd64.tar.gz"
      sha256 "9675a7720fa397bb47bbe0bca4a6777830e8923d5efa400c9a75a6156c9c934e"
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
