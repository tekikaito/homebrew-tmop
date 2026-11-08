cask "tmop" do
  version "0.7.0"
  sha256 "5701bff07ea6f310b50875f3d797b7a5bad6df6c2aa0266bb41a01f84bcbb333"

  url "https://github.com/tekikaito/tmop/releases/download/v#{version}/TMOP-v#{version}-macos-universal.zip"
  name "TMOP"
  desc "Task Manager OverPowered: skinnable system monitor"
  homepage "https://tekikaito.github.io/tmop/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "TMOP.app"

  # TMOP is not notarized; like the install command, start it without the "could not verify" prompt.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/TMOP.app"], must_succeed: false
  end

  zap trash: "~/Library/Application Support/TMOP"
end
