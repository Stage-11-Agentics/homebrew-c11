cask "c11" do
  version "0.65.2"
  sha256 "4c235a05d4d25e14b0111a5c6859589f1faff2d227d3236279561136b9268f92"

  url "https://github.com/Stage-11-Agentics/c11/releases/download/v#{version}/c11-macos.dmg"
  name "c11"
  desc "Native macOS terminal multiplexer for AI coding agents"
  homepage "https://github.com/Stage-11-Agentics/c11"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  conflicts_with cask: "cmux"

  app "c11.app"
  binary "#{appdir}/c11.app/Contents/Resources/bin/c11"
  binary "#{appdir}/c11.app/Contents/Resources/bin/c11", target: "cmux"

  zap trash: [
    "~/Library/Application Support/c11",
    "~/Library/Application Support/c11mux",
    "~/Library/Application Support/cmux",
    "~/Library/Caches/c11",
    "~/Library/Caches/c11mux",
    "~/Library/Caches/cmux",
    "~/Library/Preferences/com.stage11.c11.plist",
    "~/Library/Preferences/com.stage11.c11mux.plist",
    "~/Library/Preferences/ai.manaflow.cmuxterm.plist",
  ]
end
