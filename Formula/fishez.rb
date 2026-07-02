class Fishez < Formula
  desc "Lightning-fast terminal file manager for developers"
  homepage "https://github.com/ioma8/fishez"
  version "0.3.0"
  license "MIT"

  depends_on "fd"
  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-macos-aarch64"
      sha256 "3be005a0e6575cf06a57a07e3c6f9ee214805dc7af0f7e2296a3fff382c30d22"
    end

    on_intel do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-macos-x86_64"
      sha256 "8eec2f585fb9949546188c2b204b318cd65c934268f01e137eb8f84e23b3e389"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-linux-aarch64"
      sha256 "914b14834cb7a65e518df745dac6e2b15d2c889004a0204885b5660c42b51971"
    end

    on_intel do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-linux-x86_64"
      sha256 "01661e0bb91ee5f0e73c753aec096b1002000e1b224deed1e4d58f57ec9368fc"
    end
  end

  def install
    bin.install Dir["fishez-*"].first => "fishez"
  end

  def caveats
    <<~EOS
      To enable the fz cd-on-exit wrapper, add this to your shell rc:
        eval "$(fishez --init)"
    EOS
  end

  test do
    assert_match "fz()", shell_output("#{bin}/fishez --init")
  end
end
