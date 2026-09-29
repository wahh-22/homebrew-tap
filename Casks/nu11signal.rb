cask "nu11signal" do
  version "0.2.0"
  sha256 "0bf3eb78773c73221fa0704bdfa4162e5803c735f540c0e7b868f8213bb0fedc"

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
