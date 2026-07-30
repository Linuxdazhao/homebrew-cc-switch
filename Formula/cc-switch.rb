class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.3.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "41ec463eb803be8da7924d5cdb410acc0a4049dfaacd1507e71fa263267b5707"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "41b249290e8672b44d6c966379e2073e9adca8721ebe8e649d94d19c0a7b8c4f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49e9cf25984ba4ce75d25e7444ea0a1833b3c99fdc7b175e375ad228e26b3cad"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbcb062135878e9fbfa54ff7b6ddc5430cf13b6d4a09ea35cfb5de16c5049634"
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
