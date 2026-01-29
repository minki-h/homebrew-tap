class GitWorktreeFzf < Formula
  desc "Interactive Git worktree manager powered by fzf"
  homepage "https://github.com/minki-h/git-worktree-fzf"
  url "https://github.com/minki-h/git-worktree-fzf/archive/v1.3.4.tar.gz"
  sha256 "2f2616ade1b35b7824e4b1cc33aec5d8da307aae4ff621d314618489638cbd02"
  license "MIT"
  version "1.3.4"

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

