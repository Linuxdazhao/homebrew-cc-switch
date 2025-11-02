class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.0/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "748bd773adc175855893cae15b9387e72759b39318bbf86339cade20c9159d74"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.0/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "d438fd7d78790311b15dd2f3f259de2948e51b7b25825d86efa99b59c48b642d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.0/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5b22e758443870ff84ec1cd33d486d40d0052b4f70511f455545c4531dd3479"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.0/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ebbc0de09e6ee93ceb9eb50d33f9105e9a555d76e8e025ae4fa62ed82e1a876"
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
