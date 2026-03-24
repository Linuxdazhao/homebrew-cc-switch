class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.5"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.5/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "d27b8a731aea41d74c624e39d4b41e7710e61a33f252f8cc2d9d994615e78411"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.5/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "cb8b125eebf80c96b5215385c8e7b1417217ea740778b2a99bfca5fdc9566645"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.5/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0669797479e95770ffc570630c490b90ced0ae96207a17d615cd4b623befa39"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.5/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8cd7e1c1c476cdf3a303109ed841220423517a222d6eb816e5a86b76a119fb4a"
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
