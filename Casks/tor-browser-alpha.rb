cask "tor-browser-alpha" do
  version "11.0a2"
  sha256 "77886e631be5fa21a9fd0d48a61ae76f740ff8122a26015ca978ef889925ef29"

  url "https://dist.torproject.org/torbrowser/#{version}/TorBrowser-#{version}-osx64_en-US.dmg"
  name "Tor Browser"
  desc "Web browser focusing on security"
  homepage "https://www.torproject.org/"

  livecheck do
    url "https://www.torproject.org/download/alpha/"
    strategy :page_match
    regex(%r{href=.*?/TorBrowser-(\d+(?:.\d+)*)-osx64_.*\.dmg}i)
  end

  auto_updates true
  conflicts_with cask: "tor-browser"

  app "Tor Browser.app"

  zap trash: [
    "~/Library/Application Support/TorBrowser-Data",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.mozilla.tor browser.sfl*",
    "~/Library/Preferences/org.mozilla.tor browser.plist",
    "~/Library/Preferences/org.torproject.torbrowser.plist",
    "~/Library/SavedApplicationState/org.torproject.torbrowser.savedState",
  ]
end
