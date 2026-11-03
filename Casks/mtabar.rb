cask "mtabar" do
  version "1.1.0"
  sha256 "bc759495a79c6642318342c3811113e4ff59839546368d401c9bc86bbbea35cd"

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
