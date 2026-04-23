class Nav < Formula
  desc "Tiny terminal file navigator with vim keys"
  homepage "https://github.com/TheGentleTurtle/nav"
  url "https://github.com/TheGentleTurtle/nav/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "143633553544889994b0f4b345f69df3a7b031414a419ad3ca20e0c0a8fae993"
  license "CC-BY-NC-4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  def caveats
    <<~EOS
      To use nav for changing directories, add this to your shell config:

        # --- nav - terminal directory navigator ---
        nav() {
          local dir
          dir="$(NAV_WRAPPED=1 command nav)"
          if [ -n "$dir" ] && [ -d "$dir" ]; then
            cd "$dir"
          fi
        }
        # --- end nav ---
    EOS
  end

  test do
    assert_match "nav", shell_output("#{bin}/nav --help 2>&1", 1)
  end
end
