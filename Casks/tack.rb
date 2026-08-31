cask "tack" do
  version "0.1.0"
  sha256 "705d96ce0ad8d7693d6f372c089279814007eab4876760e85b4e49d0f7552b8f"

  url "https://github.com/TheGentleTurtle/homebrew-tap/releases/download/tack-v#{version}/Tack-#{version}-arm64.zip"
  name "Tack"
  desc "Focused keyboard-first task scratchpad with persistent desktop pins"
  homepage "https://github.com/TheGentleTurtle/homebrew-tap#tack"

  livecheck do
    url "https://github.com/TheGentleTurtle/homebrew-tap"
    regex(/^tack-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on formula: "gh"
  depends_on macos: :sonoma

  app "Tack.app"

  uninstall quit: "dev.local.Tack"

  zap trash: [
    "~/Library/Application Support/Tack",
    "~/Library/Caches/dev.local.Tack",
    "~/Library/Preferences/dev.local.Tack.plist",
    "~/Library/Saved Application State/dev.local.Tack.savedState",
  ]

  caveats do
    unsigned_accessibility
  end
end
