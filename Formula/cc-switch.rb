class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.0.34"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "7cf958f87485605499caa4f46a54e75ebb4905a96ea698d4ef025d3c0e0b6858"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "e3330202efc26f6f4a7927219a53aa7b582074c16229c50b87a2b84933cb016a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e18be4d81e8e52de3c96c2a5f4037b50071e914944ab1372c436a7e34a18bf2a"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0856b6d97d352278319f675f7cd1327d5ac3d1e04137b192441b49fcb9375aac"
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
