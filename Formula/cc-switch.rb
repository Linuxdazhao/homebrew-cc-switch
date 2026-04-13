class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.8"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.8/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "405b51daa1132eeaff0bc73a29e917c2761b7a7e5b5d3eea4cc72752633bb678"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.8/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "b473d87ca1b27ced58609a681bda952405d30c81db9bc60bd1ee27148669a691"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.8/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b62584f6cb8a874bc460fedafbac6ff6c5bc4f10355fc250f0322a6bdfd739a4"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.8/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5102d6f1268b119ce0ddb740d9c6d93e2fbadee2d519f5701638cd2950a8437"
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
