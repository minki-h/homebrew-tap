class GitWorktreeFzf < Formula
  desc "Interactive Git worktree manager powered by fzf"
  homepage "https://github.com/minki-h/git-worktree-fzf"
  url "https://github.com/minki-h/git-worktree-fzf/archive/v1.4.0.tar.gz"
  sha256 "aca72f9806af28070cc850d5e894f1b9272d2a4302cf2aa65e0fdec70cfa307e"
  license "MIT"
  version "1.4.0"

  depends_on "fzf" => :recommended

  def install
    bin.install "bin/gwf"
    bash_completion.install "completions/gwf.bash" => "gwf"
    zsh_completion.install "completions/gwf.zsh" => "_gwf"
  end

  def caveats
    <<~EOS
      To enable directory switching, add this to your shell config:

      eval "$(gwf shell-init)"
    EOS
  end

  test do
    assert_match "gwf version", shell_output("#{bin}/gwf version")
  end
end

