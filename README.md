# homebrew-cc-switch

Homebrew tap for [cc-switch](https://github.com/Linuxdazhao/cc_auto_switch) - A CLI tool for managing multiple Claude API configurations and automatically switching between them.

## Installation

```bash
# Add the tap
brew tap Linuxdazhao/cc-switch

# Install cc-switch
brew install cc-switch
```

## Usage

After installation, you can use `cc-switch` command:

```bash
# Add a configuration
cc-switch add my-config TOKEN_HERE https://api.anthropic.com

# Switch between configurations  
cc-switch use my-config

# Interactive mode
cc-switch current

# List all configurations
cc-switch list
```

## Shell Completion

### Fish
```bash
cc-switch completion fish > ~/.config/fish/completions/cc-switch.fish
```

### Zsh
```bash
mkdir -p ~/.zsh/completions
cc-switch completion zsh > ~/.zsh/completions/_cc-switch
echo 'fpath=(~/.zsh/completions $fpath)' >> ~/.zshrc
```

### Bash
```bash
cc-switch completion bash > ~/.bash_completion.d/cc-switch
echo 'source ~/.bash_completion.d/cc-switch' >> ~/.bashrc
```

## Alternative Installation Methods

- **From source**: `cargo install cc-switch`
- **From crates.io**: Available at https://crates.io/crates/cc-switch
- **Binary releases**: Download from [GitHub Releases](https://github.com/Linuxdazhao/cc_auto_switch/releases)

## More Information

For detailed documentation and usage examples, visit the main repository: https://github.com/Linuxdazhao/cc_auto_switch