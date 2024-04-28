cask "lkdots" do
  name "lkdots"
  homepage "https://github.com/fengkx/lkdots"
  desc "A cli tool to create symbol link of dotfiles with encryption and more(maybe)"
  
  arch arm: "aarch64", intel: "x86_64"
  version "0.0.6"
  sha256 intel: "27691e7b5dfbff6503930434e00b42a93a41697c9cc2af048d7b93ae6c99ea0e",
    arm: "e25f88bfec49672a1c89eadf8302890a9a39d7e1ce7a1432b15f8ef9abc316fa"

  

  url "https://github.com/fengkx/lkdots/releases/download/v#{version}/lkdots-v#{version}-#{arch}-apple-darwin.tar.gz"

  binary "lkdots-v#{version}-#{arch}-apple-darwin/lkdots"

  livecheck do
    url :url
    strategy :github_latest
  end

end
