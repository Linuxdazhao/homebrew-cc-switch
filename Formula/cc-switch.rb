class CcSwitch < Formula
  desc "A CLI tool for managing multiple Claude API configurations and automatically switching between them"
  homepage "https://github.com/Linuxdazhao/cc_auto_switch"
  version "0.1.10"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.10/cc-switch-aarch64-apple-darwin.tar.gz"
      sha256 "1b15ff9f87765fe6111d928a0ec3ba3e3341e71d26f94cf5d697b51e1edab6ba"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.10/cc-switch-x86_64-apple-darwin.tar.gz"
      sha256 "93e0405df7862f23e6b3842ef77427b88ebf4c38aa1b8b2214fa24c95a67b427"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.10/cc-switch-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "84607c00159704d7d1f1ba4fdc9e0905584d1bde55d30413293424fbea2589c2"
    else
      url "https://github.com/Linuxdazhao/cc_auto_switch/releases/download/v0.1.10/cc-switch-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c29e23284b80dbe8d62a6a171d0c3c29ee6f25a669e777bbe7e087727e559f60"
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
         cc-switch

      4. Shell completion:
         # For fish
         cc-switch completion fish > ~/.config/fish/completions/cc-switch.fish
    EOS
  end
end
