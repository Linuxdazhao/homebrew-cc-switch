class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.3/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "42cd46dfe43722f51ad3066aee649e75e9d59606bf7d647049900e8065e3e339"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.3/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "1e3fdc0f8818a91bbc345dee22ff2249e5603421752c82b2b0917b3d2ac5e664"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.3/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27d84803cd58ffc6419b844c3c60a4f32cf622c429933554a77350be53a5ecc0"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.3/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ebdabc38a00e28406e88a9a48451c92d224b774f8303972cb052d098a978e7f"
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
