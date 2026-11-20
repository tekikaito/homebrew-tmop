cask "tmop" do
  version "0.11.0"
  sha256 "afd212f987589de5dc5c9b6e6be2644e8867feb607fd5ce0d1ef445f7dc538a4"

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
