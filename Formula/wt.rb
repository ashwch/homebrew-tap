class Wt < Formula
  desc "Interactive git worktree dashboard with fzf TUI"
  homepage "https://github.com/ashwch/wt"
  url "https://github.com/ashwch/wt/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7b9d9e7d057aaba9a1d62389f57d00e302a30b8777e75af1fc8f3f5ec7355c6c"
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
      To enable cd support, add to your ~/.zshrc:
        source #{HOMEBREW_PREFIX}/share/wt/wt.zsh
    EOS
  end

  test do
    assert_match "wt #{version}", shell_output("#{bin}/wt --version")
    assert_match "USAGE", shell_output("#{bin}/wt --help")
  end
end
