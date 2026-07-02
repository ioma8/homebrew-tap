class Fishez < Formula
  desc "Lightning-fast terminal file manager for developers"
  homepage "https://github.com/ioma8/fishez"
  version "0.3.1"
  license "MIT"

  depends_on "fd"
  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-macos-aarch64"
      sha256 "999e9372a400446bff2e1a2d429edfcdc440e7d94af3c67e403590debd823c14"
    end

    on_intel do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-macos-x86_64"
      sha256 "0b3ef8c9e1f4b2269cd4d439cbb1d74f89f723ea7d6bbc9614e638e41b8ca383"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-linux-aarch64"
      sha256 "20067e8a1c40662a0cc095f2651f27eda42aff13d7e03c0be3110c96a77b0efb"
    end

    on_intel do
      url "https://github.com/ioma8/fishez/releases/download/v#{version}/fishez-linux-x86_64"
      sha256 "daea11b8ac2e909c9e8ee0a61d9b5768fbb7c78cfaa3b71ba8b68ecb01335e01"
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
