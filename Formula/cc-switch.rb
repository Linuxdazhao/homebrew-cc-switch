class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.12"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.12/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "ba36fcb29e2b76d34acadf693b7e0c340f11a0d591cc38e79872d7e71ac809fd"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.12/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "cd9f3d8135f06e8b062c8b9ae6c7089ecb7705b94ae828045bfebf1f51e27e45"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.12/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7619333dd5268cadae167f9c2a33ff8e80397b75820ea01aeb93f82a4ffab1fc"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.12/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da13407a51b2e3a5264a71c63d7779f40b233182e0796a84b1fc57817f63045d"
    end
  end

  def install
    bin.install "cc-switch"
  end

  test do
    assert_match "cc-switch", shell_output("#{bin}/cc-switch --help")
    assert_match version.to_s, shell_output("#{bin}/cc-switch --version")
  end

  def caveats
    <<~EOS
      To use cc-switch effectively:

      1. Add configurations:
         cc-switch add my-config TOKEN_HERE https://api.anthropic.com

      2. Switch between configurations:
         cc-switch use my-config

      3. Interactive mode:
         cc-switch

      4. Shell completion:
         # For fish
         cc-switch completion fish > ~/.config/fish/completions/cc-switch.fish
    EOS
  end
end