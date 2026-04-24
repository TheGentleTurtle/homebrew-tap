class Nav < Formula
  desc "Tiny terminal file navigator with vim keys"
  homepage "https://github.com/TheGentleTurtle/nav"
  url "https://github.com/TheGentleTurtle/nav/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "e911591b87ce461ad7dc14926ead5e57d0b445fb9c0ed49caff83d03798a9c9c"
  license "CC-BY-NC-4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "nav", shell_output("#{bin}/nav --help 2>&1")
  end
end
