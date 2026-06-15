class Dingskit < Formula
  desc "Handy terminal commands: venv, serve, new, save, undo, gimake"
  homepage "https://github.com/TooCaLabs/DingsKit"
  url "https://github.com/TooCaLabs/DingsKit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  def install
    share.install "venv.zsh", "serve.zsh", "new.zsh", "git.zsh"

    # Single loader script so users only need one source line
    (share/"init.zsh").write <<~ZSH
      _dk_dir="${${(%):-%x}:a:h}"
      source "$_dk_dir/venv.zsh"
      source "$_dk_dir/serve.zsh"
      source "$_dk_dir/new.zsh"
      source "$_dk_dir/git.zsh"
      unset _dk_dir
    ZSH
  end

  def caveats
    <<~EOS
      Add this line to your ~/.zshrc:
        source "$(brew --prefix)/share/dingskit/init.zsh"
      Then run: source ~/.zshrc
    EOS
  end
end
