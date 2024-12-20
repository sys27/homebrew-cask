cask "115browser" do
  arch arm: "arm64", intel: "x64"

  version "27.0.6.3"
  sha256 arm:   "5a4c11cee0990cc6c234934a2348e821ef2e1585a5fc593d1194cb53ea5fa894",
         intel: "326b25739d7b418d1efc2e460afdbebc7313cd482e8537752331e29e58662ed4"

  url "https://down.115.com/client/mac/115br_v#{version}_#{arch}.dmg"
  name "115Browser"
  name "115浏览器"
  desc "Web browser"
  homepage "https://pc.115.com/browser.html#mac"

  livecheck do
    url "https://appversion.115.com/1/web/1.0/api/chrome"
    strategy :json do |json|
      json.dig("data", "mac", "version_code")
    end
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "115Browser.app"

  zap trash: [
    "~/Library/Application Support/115Browser",
    "~/Library/Caches/115Browser",
    "~/Library/Caches/org.115Browser.115Browser",
    "~/Library/Preferences/org.115Browser.115Browser.plist",
    "~/Library/Saved Application State/org.115Browser.115Browser.savedState",
  ]
end
