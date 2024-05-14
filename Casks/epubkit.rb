cask "epubkit" do
  arch arm: "arm64", intel: "x64"

  version "1.2.4"
  sha256 :no_check

  url "https://github.com/djyde/epubkit-release/releases/download/v#{version}/epubkit-#{version}-#{arch}.dmg",
      verified: "github.com/djyde/epubkit-release/"
  name "epubkit"
  desc "Best tool to convert web pages to EPUB"
  homepage "https://epubkit.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "EpubKit.app"

  zap trash: [
    "~/Library/Application Support/epubkit",
    "~/Library/Caches/epubkit-updater",
    "~/Library/Caches/org.randynamic.epubkit",
    "~/Library/Caches/org.randynamic.epubkit.ShipIt",
    "~/Library/Preferences/org.randynamic.epubkit.plist",
    "~/Library/Saved Application State/org.randynamic.epubkit.savedState",
  ]
end
