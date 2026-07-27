# nitschw/homebrew-tap

Homebrew tap for [Panewright](https://panewright.com) — an i3-style tiling
window manager for macOS.

## Install

```bash
brew trust nitschw/tap        # Homebrew requires this once for third-party casks
brew install nitschw/tap/panewright
```

The tiling engine is **built into the app** (Panewright's own build of
AeroSpace, running under Panewright's permission grant), and the cask pulls
in the visual layer — JankyBorders and SketchyBar. Nothing else to install.

Already running AeroSpace separately, any flavor? Uninstall it first — two
engines fight over the same windows.

Panewright asks for Accessibility and Input Monitoring on first launch;
they can't be granted ahead of time.

## Updating

Panewright updates itself (Sparkle, signed). The cask declares
`auto_updates`, so `brew outdated` won't nag about versions Sparkle already
installed. To force brew's own records forward anyway:

```bash
brew upgrade --cask panewright --greedy
```

Upgrading from 0.4.0 (the last version with a separate engine cask) trips a
deliberate conflict; clear it first:

```bash
brew uninstall --cask aerospace-panewright
```

## Uninstalling

`brew uninstall --cask panewright` removes the app. `--zap` additionally
clears its caches and preferences, but deliberately leaves
`~/.config/panewright` alone: that holds your configuration, saved profiles,
and backups of the configs Panewright replaced when it was installed.
Removing an app shouldn't take your saved layouts with it.

## Casks

| Cask | What |
|---|---|
| `panewright` | The app, engine included |
| `aerospace-panewright` | **Deprecated.** The standalone patched engine from the 0.4.0 era, before the engine moved inside the app |
