cask "c11mux" do
  version "0.1.0"
  sha256 "8786ff8fbbe8101d555110090e3ca69b14214a21001050af978e6b09b5d0e0e9"

  url "https://github.com/Stage-11-Agentics/c11mux/releases/download/v#{version}/c11mux-macos.dmg"
  name "c11mux"
  desc "Stage 11's fork of cmux — native macOS terminal multiplexer for AI coding agents"
  homepage "https://github.com/Stage-11-Agentics/c11mux"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  conflicts_with cask: "cmux"

  app "c11mux.app"
  binary "#{appdir}/c11mux.app/Contents/Resources/bin/cmux"

  zap trash: [
    "~/Library/Application Support/c11mux",
    "~/Library/Application Support/cmux",
    "~/Library/Caches/c11mux",
    "~/Library/Caches/cmux",
    "~/Library/Preferences/com.stage11.c11mux.plist",
    "~/Library/Preferences/ai.manaflow.cmuxterm.plist",
  ]
end
