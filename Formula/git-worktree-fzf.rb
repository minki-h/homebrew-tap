class GitWorktreeFzf < Formula
  desc "Interactive Git worktree manager powered by fzf"
  homepage "https://github.com/minki-h/git-worktree-fzf"
  url "https://github.com/minki-h/git-worktree-fzf/archive/v1.3.3.tar.gz"
  sha256 "db0af09efaca4f762e146808c3ca37e806cec0c3caa5178eb723d9c3a75a722f"
  license "MIT"
  version "1.3.3"

  depends_on "fzf" => :recommended

  def install
    bin.install "bin/gwf"
    bash_completion.install "completions/gwf.bash" => "gwf"
    zsh_completion.install "completions/gwf.zsh" => "_gwf"
  end

  def caveats
    <<~EOS
      To enable directory switching, add this to your shell config:

      gwf() {
        local result=$(command gwf "$@")
        if [[ "$result" == CD:* ]]; then
          cd "${result#CD:}"
        else
          echo "$result"
        fi
      }
    EOS
  end

  test do
    assert_match "gwf version", shell_output("#{bin}/gwf version")
  end
end

