class Flo < Formula
  desc "TUI SNMP interface monitor with identity management and dashboard engines"
  homepage "https://github.com/tonhe/flo"
  url "https://github.com/tonhe/flo/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "10712b7c95297a5457579e7b5505e2c4752c182252fd4043cc01520fc2251d91"
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
