class Nu11signal < Formula
  desc "Cyberpunk-style terminal radio for Apple Music and local music files"
  homepage "https://github.com/wahh-22/nu11signal"
  # The macOS universal archive; on_linux replaces url and sha256 per
  # architecture (a url inside on_macos is rejected by brew style).
  url "https://github.com/wahh-22/nu11signal/releases/download/v0.5.0/nu11signal-0.5.0-macos-universal.tar.gz"
  sha256 "7c0cebcaef8299c9ce6cde1a2c405387db448e4127bee04e68e078d63a93cc68"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
  end

  on_linux do
    on_intel do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.5.0/nu11signal-0.5.0-linux-amd64.tar.gz"
      sha256 "91f619959eb9a462c3368a4ee122f65604f26968779ae0e4d774ce6e74d7e615"
    end
    on_arm do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.5.0/nu11signal-0.5.0-linux-arm64.tar.gz"
      sha256 "cd9a3f70f0168da0aedaacb263e6ec8fb9854d614f9c411473606e9e99a84857"
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
