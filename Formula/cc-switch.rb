class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.38"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "4fe70e1d03703db530be8dbde2228a16a35c08dcd3de9909043c810642f05975"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "86c9fe995ba5a10370835f8a6364a7fb8e2c8a9b19cbc8886eaa5b3c821a964d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ba709b5d535f36d527ab127981c42e064703620e588a0fadbf40aa5e6b7d4d9"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2cb35e8484fa922895fa3bc6bf5b5a616e61daa906667599a5ac2c6c7c1cc1c"
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
