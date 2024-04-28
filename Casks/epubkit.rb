cask "epubkit" do
  name "epubkit"
  homepage "https://epubkit.app"
  desc "Best tool to convert web pages to EPUB. Ideal for compiling research, creating personalized reading lists, or archiving websites."
  
  arch arm: "arm64", intel: "x64"
  version "1.0.13"
  
  url "https://github.com/djyde/epubkit-release/releases/download/v#{version}/epubkit-#{version}-#{arch}.dmg"

  app "EpubKit.app"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Caches/epubkit-updater",
    "~/Library/Caches/org.randynamic.epubkit",
    "~/Library/Caches/org.randynamic.epubkit.ShipIt",
    "~/Library/Application Support/epubkit",
    "~/Library/Preferences/org.randynamic.epubkit.plist",
    "~/Library/Saved Application State/org.randynamic.epubkit.savedState",

  ]

end
