cask "arduino-ide-beta" do
  version "2.0.0,9"
  sha256 "72466d66abefd9b60964fc96131363f1f87c91173bb21aeb5af13a76d2ffce5d"

  url "https://downloads.arduino.cc/arduino-ide/arduino-ide_#{version.before_comma}-beta.#{version.after_comma}_macOS_64bit.dmg"
  name "Arduino IDE"
  desc "Electronics prototyping platform"
  homepage "https://www.arduino.cc/en/software#experimental-software"

  livecheck do
    url "https://www.arduino.cc/en/software/"
    strategy :page_match do |page|
      match = page.match(/href=.*?arduino[._-]ide[._-]v?(\d+(?:\.\d+)+)[._-]beta\.(\d+)[._-]macos[._-]64bit\.dmg/i)
      "#{match[1]},#{match[2]}"
    end
  end

  conflicts_with cask: "arduino-ide-nightly"

  app "Arduino IDE.app"

  zap trash: [
    "~/Library/Application Support/arduino-ide",
    "~/.arduinoIDE",
  ]
end
