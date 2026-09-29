cask "nu11signal" do
  version "0.2.1"
  sha256 "36cfb473f47168b8ba8cfdb5ef0a63af82f3d1a54b419193977e296982f0d76e"

  url "https://github.com/wahh-22/nu11signal/releases/download/v#{version}/nu11signal-#{version}-macos-universal.tar.gz"
  name "Nu11Signal"
  desc "Cyberpunk-style terminal radio for Apple Music"
  homepage "https://github.com/wahh-22/nu11signal"

  depends_on macos: ">= :sonoma"

  binary "nu11signal-#{version}/bin/nu11signal"

  caveats <<~EOS
    Nu11Signal requires an Apple Music subscription.
    The first launch asks for access to Apple Music; if it was denied, enable
    Nu11SignalHelper in System Settings > Privacy & Security > Media & Apple Music.
  EOS
end
