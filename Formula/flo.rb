class Flo < Formula
  desc "TUI SNMP interface monitor with identity management and dashboard engines"
  homepage "https://github.com/tonhe/flo"
  url "https://github.com/tonhe/flo/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "d478d6d3057176f2d95a92df2ed508f1a05b958e279496a98cb3153b207b90bc"
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
