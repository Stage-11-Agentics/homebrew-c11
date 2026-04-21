cask "c11" do
  version "0.59.0"
  sha256 :no_check  # TODO: pin to SHA256 of first c11 release DMG; update-homebrew.yml rewrites this file on release.

  url "https://github.com/Stage-11-Agentics/c11/releases/download/v#{version}/c11-macos.dmg"
  name "c11"
  desc "Native macOS terminal multiplexer for AI coding agents"
  homepage "https://github.com/Stage-11-Agentics/c11"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "c11.app"
  binary "#{appdir}/c11.app/Contents/Resources/bin/c11"

  zap trash: [
    "~/Library/Application Support/c11",
    "~/Library/Application Support/c11mux",
    "~/Library/Caches/c11",
    "~/Library/Caches/c11mux",
    "~/Library/Preferences/com.stage11.c11.plist",
    "~/Library/Preferences/com.stage11.c11mux.plist",
  ]
end
