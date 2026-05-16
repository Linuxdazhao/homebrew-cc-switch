class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.16"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "8283d9e1128f74bf6fcfa40f6a25f5424648240605ab00814362745eaf755a47"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "ebbd2c436776d3b6fada82fd2cd451ca51dc5071298edf52871564e75e84d226"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e339968f263be680452a7453893505ac262609c72d0da804192a0666b1f38568"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91dae5a2d19bf2e2f3c05d2e76504641d30a888018434621e3dccdd1df777ae7"
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
