cask "nu11signal" do
  version "0.3.1"
  sha256 "3114bc118211596dac8320ca665cc9587e594af5d8ffd65d5e9501f0c607a0e3"

  url "https://github.com/wahh-22/nu11signal/releases/download/v#{version}/nu11signal-#{version}-macos-universal.tar.gz"
  name "Nu11Signal"
  desc "Cyberpunk-style terminal radio for Apple Music"
  homepage "https://github.com/wahh-22/nu11signal"

  depends_on macos: :sonoma
  # Kode Mono is the font the UI is designed with; the terminal draws the
  # UI, so it only shows once the terminal is set to use it (see caveats).
  depends_on cask: "font-kode-mono"

  binary "nu11signal-#{version}/bin/nu11signal"

  caveats <<~EOS
    Nu11Signal requires an Apple Music subscription.
    The first launch asks for access to Apple Music; if it was denied, enable
    Nu11SignalHelper in System Settings > Privacy & Security > Media & Apple Music.

    The Kode Mono font was installed for the cyberpunk look. Your terminal
    draws the UI with its own font: set it to "Kode Mono" in the terminal's
    settings to use it (Nu11Signal works with any monospaced font).
  EOS
end
