class Nu11signal < Formula
  desc "Terminal-native music player for Apple Music and local files"
  homepage "https://github.com/wahh-22/nu11signal"
  # The macOS universal archive; on_linux replaces url and sha256 per
  # architecture (a url inside on_macos is rejected by brew style).
  url "https://github.com/wahh-22/nu11signal/releases/download/v0.7.2/nu11signal-0.7.2-macos-universal.tar.gz"
  sha256 "36e4f9ab553432455e79553bf01e692431fbfabf16ec7fc03dbe9678c2ebe521"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
  end

  on_linux do
    on_intel do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.7.2/nu11signal-0.7.2-linux-amd64.tar.gz"
      sha256 "3140dc458de6f447721c72294c68ff7aa00e2e7b3cbe6c847d7f0b6ed3c6e683"
    end
    on_arm do
      url "https://github.com/wahh-22/nu11signal/releases/download/v0.7.2/nu11signal-0.7.2-linux-arm64.tar.gz"
      sha256 "95c04b3d9710a13da6e965d7a55ece9a3fe5ef0b258d70a11c192e21a36857ed"
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
