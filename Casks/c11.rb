cask "c11" do
  # Apple silicon gets each release; Intel Macs stay on 1.7.0, the
  # last universal build (C11-541).
  on_arm do
    version "1.7.7"
    sha256 "03b38f3e3214172620d030c7f358efec94f5377c4ccb48d880f7a385dc9db1a9"
  end
  on_intel do
    version "1.7.0"
    sha256 "53f8ceda80bd61c071e0563315f9626bda26587aaa671dc683e81660ce9c26a6"

    caveats <<~EOS
      c11 1.7.0 is the last release for Intel Macs. To run a newer
      c11 on this Mac, build it from source:
        https://github.com/Stage-11-Agentics/c11
    EOS
  end

  url "https://github.com/Stage-11-Agentics/c11/releases/download/v#{version}/c11-macos.dmg"
  name "c11"
  desc "Native macOS terminal multiplexer for AI coding agents"
  homepage "https://github.com/Stage-11-Agentics/c11"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

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
