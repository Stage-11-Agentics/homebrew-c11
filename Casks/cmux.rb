cask "cmux" do
  version "0.59.0"
  sha256 "0ad2cefe896443b969ff4508c2d619f02ab9410ccf2f7fcc3f18b0f72cee8a47"

  url "https://github.com/manaflow-ai/cmux/releases/download/v#{version}/cmux-macos.dmg"
  name "cmux"
  desc "Lightweight native macOS terminal with vertical tabs for AI coding agents"
  homepage "https://cmux.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "cmux.app"

  zap trash: [
    "~/Library/Application Support/cmux",
    "~/Library/Caches/cmux",
    "~/Library/Preferences/ai.manaflow.cmuxterm.plist",
  ]
end
