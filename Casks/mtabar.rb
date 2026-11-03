cask "mtabar" do
  version "1.0.0"
  sha256 "3b04eb774c62e283b041324b478bcd61193260e27b769978b0ae18335e431ccf"

  url "https://github.com/zakarlyya/mta/releases/download/v#{version}/MTABar.zip"
  name "MTA Bar"
  desc "Menu bar countdown for NYC subway arrivals"
  homepage "https://github.com/zakarlyya/mta"

  depends_on macos: ">= :sequoia"

  app "MTABar.app"

  # The app isn't notarized; clear the download quarantine so it opens without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/MTABar.app"]
  end

  uninstall quit: "com.zakariyya.mtabar"

  zap trash: "~/Library/Preferences/com.zakariyya.mtabar.plist"
end
