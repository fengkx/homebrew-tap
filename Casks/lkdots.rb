cask "lkdots" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"
  sha256 intel: "cedee22199a4f65b1f00bdb1ffdda343fdcb87f91bcb20b4b1b36810eb2b620d",
         arm:   "e1058ccd56b224f92c6a3501e3463c525c6af25098775e02e9319e2e74e3a6ca"

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
