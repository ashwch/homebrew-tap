class Wt < Formula
  desc "Interactive git worktree dashboard with fzf TUI"
  homepage "https://github.com/ashwch/wt"
  url "https://github.com/ashwch/wt/releases/download/v0.2.0/wt-0.2.0.tar.gz"
  sha256 "1edb3a539f80add47e2f03b6a1d08a8989bfc0f38e894a19e0fe46d53d794dcb"
  license "MIT"
  head "https://github.com/ashwch/wt.git", branch: "main"

  depends_on "coreutils"
  depends_on "fzf"
  depends_on "git"

  def install
    bin.install "wt"
    pkgshare.install Dir["share/wt/*"]
  end

  def caveats
    <<~EOS
      To enable cd support, add the wrapper for your shell:

      zsh:
        source #{HOMEBREW_PREFIX}/share/wt/wt.zsh

      bash:
        source #{HOMEBREW_PREFIX}/share/wt/wt.bash
    EOS
  end

  test do
    assert_match "wt #{version}", shell_output("#{bin}/wt --version")
    assert_match "USAGE", shell_output("#{bin}/wt --help")
    assert_path_exists pkgshare/"wt.bash"
    assert_path_exists pkgshare/"wt.zsh"
  end
end
