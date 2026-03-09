class Viaduct < Formula
  desc "Modern traceroute with real-time terminal UI"
  homepage "https://github.com/tonhe/viaduct"
  url "https://github.com/tonhe/viaduct/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "d06b5c2e66e878a050e8380b6d06d14d1c9f77233b984b9ac60675404f0247d8"
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
