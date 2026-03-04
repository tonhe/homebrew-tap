class Flo < Formula
  desc "TUI SNMP interface monitor with identity management and dashboard engines"
  homepage "https://github.com/tonhe/flo"
  url "https://github.com/tonhe/flo/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "ec5327cc1ba9fb2a2cdc71072597127fbec4eb1a3f212a56eef5e6f24d2beb47"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/tonhe/flo/internal/version.Version=#{version}
      -X github.com/tonhe/flo/internal/version.Build=#{tap.user}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match "flo v#{version}", shell_output("#{bin}/flo --version")
  end
end
