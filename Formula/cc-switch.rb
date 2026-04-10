class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.7"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.7/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "e704a840f4f621882b1a7ff3243aedce85cb1a36ddf4c835ef36a434abe17f3c"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.7/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "d8f61abb0b8abefe4a470e224f4e30398f53825d240eac3d210b229452190138"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.7/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2e4b6e9469182b77c936b34d828b9c94962c35a1e790642c90cb17ab83b8733"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.7/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "896fc578727c1424096acb140ff1d8b29bd8434d3ae33dd41bbb5f11ee47baf1"
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
