cask "lkdots" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.1"
  sha256 intel: "d5031208456a8603fbf4751d04e1ddaabb2d154469e114e7c5dcb57001f0728d",
         arm:   "8802dac4e9e2c01c8ae0f9280c4d0f981177b7d25a179a5ea4f7dfd612687ad3"

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
