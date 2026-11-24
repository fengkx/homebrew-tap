class Weread < Formula
  desc "Access your WeRead bookshelf and track reading sessions"
  homepage "https://github.com/fengkx/homebrew-tap/releases/tag/weread-v0.1.0"
  version "0.1.0"
  revision 1

  on_macos do
    on_arm do
      url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v#{version}/weread-#{version}-darwin-arm64.tar.gz"
      sha256 "2b84c2aff28741dea5e943fc1704ff111f9eade937c8fece78236cf6036dac39"
    end

    on_intel do
      url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v#{version}/weread-#{version}-darwin-x64.tar.gz"
      sha256 "9a9a56d41eede1e79dd3d0dfac2b9583bf627229d7be1ada5cbedef2ac5a2a82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v#{version}/weread-#{version}-linux-arm64.tar.gz"
      sha256 "d8629c37b90ef444fc173898c4b2637385875c2d99ea75673526f1a2175df3c2"
    end

    on_intel do
      url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v#{version}/weread-#{version}-linux-x64.tar.gz"
      sha256 "fa95be563816885cedefd100948fa5268a74011ed652153fb444fd82ce601767"
    end
  end

  resource "agent-skill" do
    url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v0.1.0/SKILL.md", using: :nounzip
    sha256 "4582e262470f8cd1e8c4fc431b287b2c75a7e1a1652bbbe148f92a65368509d7"
  end

  def install
    resource("agent-skill").stage { (share/"weread/skills/weread").install "SKILL.md" }
    bin.install "weread"
    doc.install "THIRD-PARTY-NOTICES.txt", "Bun-LICENSE.md"
  end

  test do
    assert_path_exists share/"weread/skills/weread/SKILL.md"
    assert_match version.to_s, shell_output("#{bin}/weread --version")
  end
end
