class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.6"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.6/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "c10430d96d708396d04d995364aadf3dc6677c09d896385075acdf63083d82c2"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.6/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "66cc88e4deac84955be562c88f2ba97883640feed36d356c210377496aa64cc2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.6/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d7ff46ba112d60f2cdff54ea82a4a8bbdf2958bb84bb5800bd987f0b87ec072"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.6/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8e472426dd01eb8dbb19098cbac31f134ed00a451705bf4776ba552e794bfe7"
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
