class GitWorktreeFzf < Formula
  desc "Interactive Git worktree manager powered by fzf"
  homepage "https://github.com/minki-h/git-worktree-fzf"
  url "https://github.com/minki-h/git-worktree-fzf/archive/v1.5.2.tar.gz"
  sha256 "d6e87e614517eef5d3015aa2490e3c59085f8201c9e7a5c3a6d6667ec03c6dc5"
  license "MIT"
  version "1.5.2"

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

