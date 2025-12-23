class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.2/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "4c907ad687ba3c5a4c539fa08456a1392ff9465a66d4f60d007f9a85a777ef8b"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.2/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "21edb94f3e094a7e220e3c3ac6924bf35fb809dabe73ea6350c514db2fb40ae3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.2/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "183cce89ae19ee4b7bb2383f1970fab485e4c6198be71a7f605964b5bf7a131f"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.2/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c902c646af5e7e538076fa4472726a2b3848e529372f50dd99aacd20804d97e4"
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
