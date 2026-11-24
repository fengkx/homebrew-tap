class Weread < Formula
  desc "Access your WeRead bookshelf and track reading sessions"
  homepage "https://github.com/fengkx/homebrew-tap/releases/tag/weread-v0.1.1"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v#{version}/weread-#{version}-darwin-arm64.tar.gz"
      sha256 "3b33cb53d6ee0ff15aebc3b6898b04162a24400e338fe68197b4d3bda5f36a2d"
    end

    on_intel do
      url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v#{version}/weread-#{version}-darwin-x64.tar.gz"
      sha256 "29224f34061738dd4422f716d2a70cea965614c7699aed18b87c52bf2a88c02e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v#{version}/weread-#{version}-linux-arm64.tar.gz"
      sha256 "bdf738ad58d2bfa41409bc7a4b2dad96c74c8bae1af04ac7f04eb5e936495afc"
    end

    on_intel do
      url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v#{version}/weread-#{version}-linux-x64.tar.gz"
      sha256 "06d96dfb3d458e8b9d19f88f4709f2ba5770480899f7032b48ddfe12fb6c7e79"
    end
  end

  resource "agent-skill" do
    url "https://github.com/fengkx/homebrew-tap/releases/download/weread-v0.1.1/SKILL.md", using: :nounzip
    sha256 "7d46da079e6b1298b718efd939309f34669c5ef2253706b0c99461a6ff6a104c"
  end

  def install
    resource("agent-skill").stage { (share/"weread/skills/weread").install "SKILL.md" }
    bin.install "weread"
    doc.install "THIRD-PARTY-NOTICES.txt", "Bun-LICENSE.md"
  end

  test do
    assert_path_exists share/"weread/skills/weread/SKILL.md"
    assert_match "renew", shell_output("#{bin}/weread auth renew --help")
    assert_match version.to_s, shell_output("#{bin}/weread --version")
  end
end
