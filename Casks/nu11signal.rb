cask "nu11signal" do
  version "0.7.2"
  sha256 "36e4f9ab553432455e79553bf01e692431fbfabf16ec7fc03dbe9678c2ebe521"

  url "https://github.com/wahh-22/nu11signal/releases/download/v#{version}/nu11signal-#{version}-macos-universal.tar.gz"
  name "Nu11Signal"
  desc "Terminal-native music player for Apple Music and local files"
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
