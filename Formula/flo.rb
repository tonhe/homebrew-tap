class Flo < Formula
  desc "TUI SNMP interface monitor with identity management and dashboard engines"
  homepage "https://github.com/tonhe/flo"
  url "https://github.com/tonhe/flo/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9bfe4098c7ad3828af12871c6a520d90b073e1b44cf5f34427369fc972205aa9"
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
