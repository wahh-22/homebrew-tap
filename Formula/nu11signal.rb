class Nu11signal < Formula
  desc "Cyberpunk-style terminal radio for Apple Music and local music files"
  homepage "https://github.com/wahh-22/nu11signal"
  # The macOS universal archive; on_linux replaces url and sha256 per
  # architecture (a url inside on_macos is rejected by brew style).
  url "https://github.com/wahh-22/nu11signal/releases/download/v0.5.1/nu11signal-0.5.1-macos-universal.tar.gz"
  sha256 "19b42ee8d5360ef74e5c0e8c1798720ea0fa195318b478db494cb4a884f66cb8"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
  end

  on_linux do
    on_intel do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.5.1/nu11signal-0.5.1-linux-amd64.tar.gz"
      sha256 "1b00be312b011c8e7ec609b660700abc09fc28717a527660bc1ae03ad2e9970c"
    end
    on_arm do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.5.1/nu11signal-0.5.1-linux-arm64.tar.gz"
      sha256 "926ddf32f5616604af67a24a0ac9a5a98cde6c2974e26cd081bfea770ae4d069"
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
