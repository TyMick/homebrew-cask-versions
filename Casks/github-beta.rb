cask "github-beta" do
  version "2.9.1-beta1-361b0ff4"

  if Hardware::CPU.intel?
    sha256 "2327831769ab33c58cc8853b51dd01fe0ad5b0f06d8058ed0dad9eabe9154348"

    url "https://desktop.githubusercontent.com/releases/#{version}/GitHubDesktop-x64.zip",
        verified: "desktop.githubusercontent.com/"
  else
    sha256 "98a295e09b537de60d0bcdfa74ba666f2f352ba219873fb4dfd3cd37b2a01685"

    url "https://desktop.githubusercontent.com/releases/#{version}/GitHubDesktop-arm64.zip",
        verified: "desktop.githubusercontent.com/"
  end

  name "GitHub Desktop"
  desc "Desktop client for GitHub repositories"
  homepage "https://desktop.github.com/"

  livecheck do
    url "https://central.github.com/deployments/desktop/desktop/latest/darwin?env=beta"
    strategy :header_match
    regex(%r{(\d+(?:\.\d+)[^/]*)/GitHubDesktop-x64\.zip}i)
  end

  auto_updates true
  conflicts_with cask: "github"

  app "GitHub Desktop.app"
  binary "#{appdir}/GitHub Desktop.app/Contents/Resources/app/static/github.sh", target: "github"

  zap trash: [
    "~/Library/Application Support/GitHub Desktop",
    "~/Library/Application Support/com.github.GitHubClient",
    "~/Library/Application Support/com.github.GitHubClient.ShipIt",
    "~/Library/Application Support/ShipIt_stderr.log",
    "~/Library/Application Support/ShipIt_stdout.log",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.github.GitHubClient.sfl*",
    "~/Library/Caches/com.github.GitHubClient",
    "~/Library/Caches/com.github.GitHubClient.ShipIt",
    "~/Library/Preferences/com.github.GitHubClient.helper.plist",
    "~/Library/Preferences/com.github.GitHubClient.plist",
  ],
      rmdir: "~/.config/git"
end
