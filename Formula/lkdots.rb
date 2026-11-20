class Lkdots < Formula
  desc "CLI tool to symlink dotfiles with encryption and projections"
  homepage "https://github.com/fengkx/lkdots"
  version "0.2.0"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/fengkx/lkdots/releases/download/v#{version}/lkdots-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e1058ccd56b224f92c6a3501e3463c525c6af25098775e02e9319e2e74e3a6ca"
    end

    on_intel do
      url "https://github.com/fengkx/lkdots/releases/download/v#{version}/lkdots-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cedee22199a4f65b1f00bdb1ffdda343fdcb87f91bcb20b4b1b36810eb2b620d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fengkx/lkdots/releases/download/v#{version}/lkdots-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24b1f896339542feef804eb5f5494ba0e6b7044ad9ab608a03331c67dd1cbff2"
    end

    on_intel do
      url "https://github.com/fengkx/lkdots/releases/download/v#{version}/lkdots-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f586375530c9218d51bfd565460a2cafd6a53d4fec4270ee880ba3ddbee982f8"
    end
  end

  def install
    bin.install "lkdots"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lkdots --version")
  end
end
