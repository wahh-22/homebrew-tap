cask "nu11signal" do
  version "0.6.0"
  sha256 "bf6d93ffce61ad6b4e36f1315f9f1c599a5c38ec23f5b40e00f628420b68b111"

  url "https://github.com/wahh-22/nu11signal/releases/download/v#{version}/nu11signal-#{version}-macos-universal.tar.gz"
  name "Nu11Signal"
  desc "Neon terminal radio for Apple Music"
  homepage "https://github.com/wahh-22/nu11signal"

  # Kode Mono is the font the UI is designed with; the terminal draws the
  # UI, so it only shows once the terminal is set to use it (see caveats).
  # brew style wants the cask dependency before the macOS one.
  depends_on cask: "font-kode-mono"
  depends_on macos: :sonoma

  binary "nu11signal-#{version}/bin/nu11signal"

  caveats <<~EOS
    Nu11Signal requires an Apple Music subscription.
    The first launch asks for access to Apple Music; if it was denied, enable
    Nu11SignalHelper in System Settings > Privacy & Security > Media & Apple Music.

    The Kode Mono font was installed for the intended look. Your terminal
    draws the UI with its own font: set it to "Kode Mono" in the terminal's
    settings to use it (Nu11Signal works with any monospaced font).
  EOS
end
