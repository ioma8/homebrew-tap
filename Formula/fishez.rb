class Fishez < Formula
  desc "Lightning-fast terminal file manager for developers"
  homepage "https://github.com/ioma8/fishez"
  version "0.4.0"
  license "MIT"

  depends_on "fd"
  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-macos-aarch64"
      sha256 "3bbfce8afde21e6b404afa0711cac240bed9e7fee654cbadd3ae78b544b38c10"
    end

    on_intel do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-macos-x86_64"
      sha256 "e5f5f35c8be3a7e3f657c637c91f9a6c91f09d7351c45a7671c2036e626bbca4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-linux-aarch64"
      sha256 "533f42fb46857240132d849753973cde5d5253d487b63aef0f25af130dfcd074"
    end

    on_intel do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-linux-x86_64"
      sha256 "f88daa6736089f6744e3ee778f8eeed9e0af80422c8230dc78ddbf69be48fbc7"
    end
  end

  def install
    binary = Dir["fishez-*"].first
    chmod 0755, binary
    bin.install binary => "fishez"
  end

  def caveats
    <<~EOS
      To enable the fz cd-on-exit wrapper, run:
        fishez --install-shell

      Then open a new shell, or source the rc file it prints.

      To remove the wrapper later:
        fishez --uninstall-shell
    EOS
  end

  test do
    assert_match "fz()", shell_output("#{bin}/fishez --init")
  end
end
