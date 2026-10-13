cask "threatsketch" do
  version "0.4.0"
  sha256 "498c347205f909a2ac7c3ba4649c2e55d72830c0bf86f56461871481019d2a38"

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
