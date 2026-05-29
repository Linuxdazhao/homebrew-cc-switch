class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.36"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "8dee78037ccdef8fb4ccc201255f554c2e345f21637df23e44af7966b3ca10ec"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "f6259d593ab5942f60886597a4227887e3f04e12f6bfff11795443019a56ecb9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1045ce635035086680a2577aaf61030675a6e865afb0d5e467ca64f41559fac7"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d95bbb2f8781a366b0491c75b243d9c500fe47ca356bf8c0e179c550bfbf98c"
    end
  end

  def install
    bin.install "cc-switch"
  end

  test do
    assert_match "cc-switch", shell_output("#{bin}/cc-switch --help")
    assert_match version.to_s, shell_output("#{bin}/cc-switch --version")
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
