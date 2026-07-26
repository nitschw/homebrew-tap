# nitschw/homebrew-tap

Homebrew tap for [Panewright](https://github.com/nitschw/Panewright) — truly
tiled windows for macOS.

## Install

```bash
brew install nitschw/tap/panewright
```

That pulls in everything Panewright supervises — AeroSpace, JankyBorders and
SketchyBar — so there's nothing else to install first.

Panewright needs Accessibility and Input Monitoring permissions, which it asks
for on first launch. They can't be granted ahead of time.

## Upgrading

```bash
brew upgrade --cask panewright
```

Panewright also updates itself through Sparkle, so whichever you use, you end
up on the same version.

## Note on uninstalling

`brew uninstall --cask panewright` removes the app. `--zap` additionally
clears its caches and preferences, but deliberately leaves
`~/.config/panewright` alone: that holds your configuration, saved profiles,
and backups of the aerospace and sketchybar configs Panewright replaced when
it was installed. Removing an app shouldn't take your saved layouts with it.
