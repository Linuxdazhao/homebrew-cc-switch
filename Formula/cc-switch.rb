class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.4"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.4/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "f87829d5095a1953fdf2c78e0e59273ccaa31d308140aba75d3daafcc8193a5e"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.4/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "548a2c21630d8952c2fc809e2e07166ac73e0d2d6619357f8b140a6fdb9852fe"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.4/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42b8a33f4a1f21d91953342bcc3136f5ea9e18f39460095f46ea213732c30556"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.4/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9aa615bfcfc81c281b3a0bc78f35b0d19ae2b96448a34064552947994eb77d32"
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
