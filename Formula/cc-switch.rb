class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.13"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.13/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "79d650342035a62351de1d47f9d85e7c3908b520c293ea67d1424ac70d0815a7"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.13/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "dad4c9199e6b0def21487a7f787e47100d4e7b65fabf62ec610b7fd3750d96c8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.13/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1cffbcb9b4bb4ff1e56a471431a1291828a0d55305725821ef230db0df302be4"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.13/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1de2e841d755e471b87be4f37b4a4149fbec80c01ac9c8553d42113d859d1b3e"
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