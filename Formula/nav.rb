class Nav < Formula
  desc "Tiny terminal file navigator with vim keys"
  homepage "https://github.com/TheGentleTurtle/nav"
  url "https://github.com/TheGentleTurtle/nav/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8ab3744b6a82a6c8a173dea85d7acf9081ca0189e1f20b33a97b2d3a38256821"
  license "CC-BY-NC-4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  def caveats
    <<~EOS
      To use nav for changing directories, add this to your shell config:

        nav() {
          local dir
          dir="$(command nav)"
          if [ -n "$dir" ] && [ -d "$dir" ]; then
            cd "$dir"
          fi
        }
    EOS
  end

  test do
    assert_match "nav", shell_output("#{bin}/nav --help 2>&1", 1)
  end
end
