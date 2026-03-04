class Nbor < Formula
  desc "TUI tool for discovering network neighbors via CDP and LLDP"
  homepage "https://github.com/tonhe/nbor"
  url "https://github.com/tonhe/nbor/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "PLACEHOLDER_WILL_BE_UPDATED_ON_RELEASE"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
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
