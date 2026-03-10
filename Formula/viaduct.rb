class Viaduct < Formula
  desc "Modern traceroute with real-time terminal UI"
  homepage "https://github.com/tonhe/viaduct"
  url "https://github.com/tonhe/viaduct/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "34577b3d4e4538310d46daf16baad815c5242e9e457f23ce83968965d6243fe1"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.buildVersion=#{tap.user}
    ]
    system "go", "build", *std_go_args(ldflags:, output: bin/"via"), "./cmd/via"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/via --version")
  end
end
