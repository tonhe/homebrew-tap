class Nbor < Formula
  desc "TUI tool for discovering network neighbors via CDP and LLDP"
  homepage "https://github.com/tonhe/nbor"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tonhe/nbor/releases/download/v#{version}/nbor_#{version}_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_ON_RELEASE"
    elsif Hardware::CPU.intel?
      url "https://github.com/tonhe/nbor/releases/download/v#{version}/nbor_#{version}_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_ON_RELEASE"
    end
  end

  def install
    bin.install "nbor"
  end

  def caveats
    <<~EOS
      nbor requires root privileges for packet capture.
      Run with: sudo nbor
    EOS
  end

  test do
    assert_match "nbor version", shell_output("#{bin}/nbor --version")
  end
end
