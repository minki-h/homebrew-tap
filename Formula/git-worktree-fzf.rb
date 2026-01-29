class GitWorktreeFzf < Formula
  desc "Interactive Git worktree manager powered by fzf"
  homepage "https://github.com/minki-h/git-worktree-fzf"
  url "https://github.com/minki-h/git-worktree-fzf/archive/v1.3.5.tar.gz"
  sha256 "c1a2b74ab7037da9d8aa839b0a97bd3d37d63a08bc81a1a4a3ccd20d0029520d"
  license "MIT"
  version "1.3.5"

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

