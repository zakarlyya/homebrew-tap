cask "mtabar" do
  version "1.0.1"
  sha256 "c0c13063327b145daa71fa58a0750a498d9fc64e88f8fa097fb52f4c7a88f221"

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
