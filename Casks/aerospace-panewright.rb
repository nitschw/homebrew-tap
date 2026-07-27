cask "aerospace-panewright" do
  version "0.21.3-Beta-pw.1"
  sha256 "3a0d44315a10d627977f5b131a2ebef63c29946c6aac11b319c9b65dde38bd4d"

  # The upstream release asset with Panewright's patches swapped in:
  # dock-aware hide corner (hidden workspaces stop peeking out around a
  # right-side Dock) and a hideable menu bar icon. Everything else in the
  # zip is byte-for-byte upstream's. Diffs: the `panewright` branch.
  url "https://github.com/nitschw/AeroSpace/releases/download/v#{version}/AeroSpace-v#{version}.zip"
  name "AeroSpace (Panewright patches)"
  desc "i3-like tiling window manager for macOS, with Panewright's patches"
  homepage "https://github.com/nitschw/AeroSpace"

  # Same app, same paths — installing both would fight over
  # /Applications/AeroSpace.app and the aerospace binary.
  conflicts_with cask: [
    "nikitabobko/tap/aerospace",
    "nikitabobko/tap/aerospace-dev",
  ]

  deprecate! date: "2026-07-27", because: "the tiling engine now ships inside the Panewright app itself"

  depends_on macos: :ventura

  app "AeroSpace-v#{version.sub(/-pw\.\d+$/, "")}/AeroSpace.app"
  binary "AeroSpace-v#{version.sub(/-pw\.\d+$/, "")}/bin/aerospace"

  binary "AeroSpace-v#{version.sub(/-pw\.\d+$/, "")}/shell-completion/zsh/_aerospace",
      target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_aerospace"
  binary "AeroSpace-v#{version.sub(/-pw\.\d+$/, "")}/shell-completion/bash/aerospace",
      target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/aerospace"
  binary "AeroSpace-v#{version.sub(/-pw\.\d+$/, "")}/shell-completion/fish/aerospace.fish",
      target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/aerospace.fish"

  Dir["#{staged_path}/AeroSpace-v#{version.sub(/-pw\.\d+$/, "")}/manpage/*"].each { |man| manpage man }

  uninstall quit: "bobko.aerospace"

  caveats do
    <<~EOS
      Signed under a different identity than upstream AeroSpace, so if you
      are switching from the stock cask, macOS will ask you to re-grant
      Accessibility: System Settings → Privacy & Security → Accessibility →
      toggle AeroSpace off and on.
    EOS
  end
end
