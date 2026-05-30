class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.40"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "4209bb60c328921bc0ceef98c8c9b5972b383088fc9166eefcf3509ca7c2b180"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "46e006dd08e0e71eb4215bddee9aeedfd4f27fc8f660f26c3c60202ee6f6f5b5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e9115902100edcb0da4a40849cdda3fcd2ec6606afaf34443b7b1dcd796d15a"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4bf9a208959ac0e9f18a7bc18ca83b952d8000505e082c26f402c97cfa4f1d9e"
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
 cc-switch current

      4. Shell completion:
 # For fish
 cc-switch completion fish > ~/.config/fish/completions/cc-switch.fish

 # For zsh
 cc-switch completion zsh > ~/.zsh/completions/_cc-switch

 # For bash
 cc-switch completion bash > ~/.bash_completion.d/cc-switch

      For more information, visit: https://github.com/Linuxdazhao/cc_auto_switch
    EOS
  end
end
