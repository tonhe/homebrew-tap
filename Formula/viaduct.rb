class Viaduct < Formula
  desc "Modern traceroute with real-time terminal UI"
  homepage "https://github.com/tonhe/viaduct"
  url "https://github.com/tonhe/viaduct/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "00a6bf4389621b07a83c4bf3a0ca37562ec3e19fb48f1d2c5344bf640ba58e37"
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
