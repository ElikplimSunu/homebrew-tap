cask "threatsketch" do
  version "0.3.1"
  sha256 "fd52f18cc32dd881b8898bf0787400ef023a66c345a618b4cb14934340efcd92"

  url "https://github.com/ElikplimSunu/threatsketch/releases/download/v#{version}/ThreatSketch_#{version}_universal.dmg"
  name "ThreatSketch"
  desc "Draw a data-flow diagram, get Microsoft TMT's STRIDE threats"
  homepage "https://github.com/ElikplimSunu/threatsketch"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

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
