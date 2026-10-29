cask "c11" do
  version "1.5.1"
  sha256 "991c6b645c2454f120629b1ff9279890d350f948fa75389ec5a2bb3c770b8f63"

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
