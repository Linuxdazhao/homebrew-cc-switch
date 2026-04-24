class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.9"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.9/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "9560e2ea7002d86e1e21db83e0f71ef85107f14ea669988e84dc6b1d35e2c06a"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.9/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "411afbc05730dee8c394a271a7ffee72fd60b2f9ca7c476409af047975eb5718"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.9/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01cf06f82bd293046b882cd603c34b554fd0d06d1fcd5284f79d7ce247c18381"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.9/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff02a82be8badef215b3b68f9e496b12dc0b9beda972a9a38710ebfde0433f9b"
    end
  end

  def install
    bin.install "cc-switch"
  end

  test do
    assert_match "cc-switch", shell_output("#{bin}/cc-switch --help")
    assert_match version.to_s, shell_output("#{bin}/cc-switch version")
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
