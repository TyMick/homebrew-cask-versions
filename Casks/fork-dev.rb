cask "fork-dev" do
  version "2.10"
  sha256 "cb1da0ed3d03d318172acd768b5dda7584b80f9f811c88f3bcfc9e616a9274a3"

  url "https://forkapp.ams3.cdn.digitaloceanspaces.com/mac/Fork-#{version}.dmg",
      verified: "forkapp.ams3.cdn.digitaloceanspaces.com/mac/"
  name "Fork"
  desc "GIT client"
  homepage "https://git-fork.com/"

  livecheck do
    url "https://git-fork.com/update/feed.xml"
    strategy :sparkle do |item|
      item.url[%r{/Fork-(\d+(?:\.\d+)*)\.dmg}i, 1]
    end
  end

  auto_updates true
  conflicts_with cask: "fork"

  app "Fork.app"
  binary "#{appdir}/Fork.app/Contents/Resources/fork_cli", target: "fork"

  zap trash: [
    "~/Library/Application Support/Fork",
    "~/Library/Application Support/com.DanPristupov.Fork",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.danpristupov.fork.sfl2",
    "~/Library/Caches/com.DanPristupov.Fork",
    "~/Library/Cookies/com.DanPristupov.Fork.binarycookies",
    "~/Library/Logs/Fork.log",
    "~/Library/Preferences/com.DanPristupov.Fork.plist",
    "~/Library/Saved Application State/com.DanPristupov.Fork.savedState",
    "~/Library/WebKit/com.DanPristupov.Fork",
  ]
end
