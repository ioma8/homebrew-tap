class Fishez < Formula
  desc "Terminal file manager with Total Commander-style controls"
  homepage "https://github.com/ioma8/fishez"
  version "0.5.0"
  license "MIT"

  depends_on "fd"
  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-macos-aarch64"
      sha256 "a731ff94490610139ef4d8e362cd246c5de02d514fc050101153bdce3f6ae7cd"
    end

    on_intel do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-macos-x86_64"
      sha256 "7f51f2470ab300f24621fe85367be233fef4872f23e9b9a453e8fa72aaff47b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-linux-aarch64"
      sha256 "b99dddf4c0982fd876e558e0a7f089662ff385a5fb848abab25dd1661a304ea0"
    end

    on_intel do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-linux-x86_64"
      sha256 "37f1a87d0b0a35cae5f667635e943ad92fc71c02c5e34f49d6c0c67be3b94a3f"
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
