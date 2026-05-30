class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.41"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "8117ff8baa8587abd395f5647449420f4edc50cdeb4c091b195975d731fb963e"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "e84837e03ecc355ed84a757bb17d137a03981b0a87a319d5b98a7eaadb64bb2d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01c0d6af498c098f64cd9930883b8744088a717902ecb13a136456ccb011290d"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v#{version}/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f01374714ba268b799e19a84ec1f262c097f6baf45dfe33daa3d978f865bbd67"
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
