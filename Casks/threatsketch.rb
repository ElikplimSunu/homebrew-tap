cask "threatsketch" do
  version "0.5.1"
  sha256 "b0cd0a6f9a75906fe5c55c661b2c479322692343f88c553c1db2d5c44476bd64"

  url "https://github.com/ElikplimSunu/threatsketch/releases/download/v#{version}/ThreatSketch_#{version}_universal.dmg"
  name "ThreatSketch"
  desc "Draw a data-flow diagram, get Microsoft TMT's STRIDE threats"
  homepage "https://github.com/ElikplimSunu/threatsketch"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :big_sur

  app "ThreatSketch.app"

  zap trash: [
    "~/Library/Application Support/io.github.elikplimsunu.threatsketch",
    "~/Library/Caches/io.github.elikplimsunu.threatsketch",
    "~/Library/WebKit/io.github.elikplimsunu.threatsketch",
  ]

  caveats <<~EOS
    ThreatSketch is not signed by Apple. The first time you open it, choose
    Open Anyway in System Settings > Privacy & Security.
  EOS
end
