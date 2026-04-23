class Nav < Formula
  desc "Tiny terminal file navigator with vim keys"
  homepage "https://github.com/TheGentleTurtle/nav"
  url "https://github.com/TheGentleTurtle/nav/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "3b6facd2ecac0e8772c0dba096ffddce3505653e9e08a62bce87c76e7910ae21"
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
