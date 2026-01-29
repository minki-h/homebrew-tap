class GitWorktreeFzf < Formula
  desc "Interactive Git worktree manager powered by fzf"
  homepage "https://github.com/minki-h/git-worktree-fzf"
  url "https://github.com/minki-h/git-worktree-fzf/archive/v1.3.6.tar.gz"
  sha256 "06006925ede335eed39b782afe80748e92e38b7a67b21dc6060914f61d95be28"
  license "MIT"
  version "1.3.6"

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

