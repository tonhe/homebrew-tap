class Via < Formula
  desc "Modern traceroute with real-time terminal UI"
  homepage "https://github.com/tonhe/viaduct"
  url "https://github.com/tonhe/viaduct/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "90cfe93962790d7a546921969fe389e67a56aa6cbd7bd2ad7fd481169f987bfb"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.buildVersion=#{tap.user}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/via"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/via --version")
  end
end
