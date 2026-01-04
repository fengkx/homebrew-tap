cask "lkdots" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"
  sha256 intel: "5c5ba46636dca6fc4c2d00771b44cf52be17b2cf93396c9f16767f442afb4130",
         arm:   "841c4c51fcaf3011bea3c7888e27bc0a428561bd07d495eba6eeacdf039da540"

  url "https://github.com/fengkx/lkdots/releases/download/v#{version}/lkdots-v#{version}-#{arch}-apple-darwin.tar.gz"
  name "lkdots"
  desc "Cli tool to create symbol link of dotfiles with encryption"
  homepage "https://github.com/fengkx/lkdots"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "lkdots-v#{version}-#{arch}-apple-darwin/lkdots"
end
