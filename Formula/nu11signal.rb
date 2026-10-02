class Nu11signal < Formula
  desc "Cyberpunk-style terminal radio for Apple Music and local music files"
  homepage "https://github.com/wahh-22/nu11signal"
  # The macOS universal archive; on_linux replaces url and sha256 per
  # architecture (a url inside on_macos is rejected by brew style).
  url "https://github.com/wahh-22/nu11signal/releases/download/v0.4.0/nu11signal-0.4.0-macos-universal.tar.gz"
  sha256 "d06a3f79347acdf7d3a64fe15dd2fcd13d8d272dd579c700de234d5a8219fb24"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
  end

  on_linux do
    on_intel do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.4.0/nu11signal-0.4.0-linux-amd64.tar.gz"
      sha256 "9481b5d0cd1e554ea4a104342aa72c92f1deaffeb42067fc4337d74f0b3b3b8b"
    end
    on_arm do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.4.0/nu11signal-0.4.0-linux-arm64.tar.gz"
      sha256 "99436700cdbe5cc29442d13c9a659e2db8488815c66af251472a034301ec9fd5"
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
