class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.0.40"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "8d209c416e84447824810a676dd831c0308337f62c8c1d38046b023d884edc50"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "ef0b3a0c515b90d827e5e46343958a523de8c850ca911ee3e957705cb7a0fb01"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10381c17523d4b643552bb477ebc99cb4e16c5cf78408e47d3a0b39dc5f30f32"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ece93ef84f591dcf14d32d969920615bcbb6b2a5d36faed7b8a0eb67b73ca64d"
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