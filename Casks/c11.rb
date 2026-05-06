cask "c11" do
  version "0.46.0"
  sha256 "c4e4a61f633d7a3d73942f377f18ff00a14f01cbb41ece05cae6e3312f7b80d6"

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
