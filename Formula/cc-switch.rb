class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.14"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "87c9e3f9ddd559607bdefc29daf8cc2375a47a1a9575f0e1f724b62996b067da"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "9c970d78daddd5898e1bb27cd2fad44e938c2d8c9dbb937912c792c0207e3679"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7131bd1cc600e79340edc15f404a37d72ac34137df8bb40c931de0e3202bada8"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f97775ee93a0d1bf6607f4dedc1aac889265a469273be6e8d651cd883de9ef7"
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
