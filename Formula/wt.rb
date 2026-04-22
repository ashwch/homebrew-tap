class Wt < Formula
  desc "Interactive git worktree dashboard with fzf TUI"
  homepage "https://github.com/ashwch/wt"
  url "https://github.com/ashwch/wt/releases/download/v0.3.0/wt-0.3.0.tar.gz"
  sha256 "74c47a328814c00668170b44d9c42a10d623f2c48b3358cb8211f9aa101ade19"
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
