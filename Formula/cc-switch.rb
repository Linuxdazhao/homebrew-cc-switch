class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.1/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "a22baa722a2a72ebfa198060d977133644979e0bd26449e64293ccc010ea896a"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.1/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "663bc51d0be20e0205ec7e933337671e245477c751c4f40241180655ccd2c975"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.1/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b031f687d3b28caadc9c88d2b8c37312bdb6e8b2166849fc7c686392b432624b"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.1/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e4f4c6e3d3b26f2b542d5f26a4c35747a390dd6036cfe3d074bf9ed8bd61a33"
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
