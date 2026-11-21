cask "tmop" do
  version "0.15.1"
  sha256 "c32a1d08a6bef225977e41fcbbad1f00f42c89a5e8d6f43a2004e7a344ca748d"

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
