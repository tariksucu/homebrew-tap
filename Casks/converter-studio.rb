# Written by apps/desktop/scripts/package-managers.mjs from the published DMG (release day).
cask "converter-studio" do
  version "0.2.1"
  sha256 "dddb80c5c8dfba46506e4ef8510312b5db0948d982715c73025ead092473182c"

  url "https://converter.studio/downloads/desktop/#{version}/Converter-Studio-#{version}-mac-universal.dmg"
  name "Converter Studio"
  desc "Convert video, audio, images, PDFs and documents on your computer"
  homepage "https://converter.studio/"

  livecheck do
    url "https://converter.studio/desktop/release.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :ventura

  app "Converter Studio.app"
  binary "#{appdir}/Converter Studio.app/Contents/Resources/bin/converter-studio"

  zap trash: [
    "~/Library/Application Support/Converter Studio",
    "~/Library/Preferences/studio.converter.desktop.plist",
    "~/Library/Saved Application State/studio.converter.desktop.savedState",
  ]
end
