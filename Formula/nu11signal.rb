class Nu11signal < Formula
  desc "Terminal-native music player for Apple Music and local files"
  homepage "https://github.com/wahh-22/nu11signal"
  # The macOS universal archive; on_linux replaces url and sha256 per
  # architecture (a url inside on_macos is rejected by brew style).
  url "https://github.com/wahh-22/nu11signal/releases/download/v0.7.1/nu11signal-0.7.1-macos-universal.tar.gz"
  sha256 "18ec4c6d4b2af67d1fd5ddeeaf3a7ab89455f0f04a97998bf0b004c10b051b57"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
  end

  on_linux do
    on_intel do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.7.1/nu11signal-0.7.1-linux-amd64.tar.gz"
      sha256 "a2af2ab85bf65f6427963c209580a2fe6866241a91fde725c3fe344bf5a1dc56"
    end
    on_arm do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.7.1/nu11signal-0.7.1-linux-arm64.tar.gz"
      sha256 "fb8ddd8a7c321035b95cdf233ed1b86db705535b172ec3fece2e495bb688593b"
    end
  end

  def install
    if OS.mac?
      prefix.install "bin", "libexec"
    else
      bin.install "bin/nu11signal"
    end
  end

  def caveats
    if OS.mac?
      <<~EOS
        The cask is the recommended macOS install (brew install --cask
        wahh-22/tap/nu11signal): it also installs the Kode Mono font the UI is
        designed with. This formula installs the same signed, notarized build.
        Nu11Signal requires an Apple Music subscription; the first launch asks
        for access to Apple Music (Nu11SignalHelper in System Settings >
        Privacy & Security > Media & Apple Music).
      EOS
    else
      <<~EOS
        On Linux nu11signal plays your local music files only (Apple Music needs
        the macOS helper). It reads ~/Music, or the folders in "music_dirs" in
        its config.json. Sound goes through PulseAudio or PipeWire
        (pipewire-pulse), falling back to ALSA.
        The UI is designed with the Kode Mono font, which a formula cannot
        install; install it with: brew install --cask font-kode-mono
        (into ~/.local/share/fonts), then set your terminal's font to it.
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nu11signal --version")
  end
end
