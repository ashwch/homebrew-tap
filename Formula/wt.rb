class Wt < Formula
  desc "Interactive git worktree dashboard with fzf TUI"
  homepage "https://github.com/ashwch/wt"
  url "https://github.com/ashwch/wt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c1c7d4abd339f5d9dd3ca6718bca078ff2ab9d40199e6f5619213176794a9b70"
  license "MIT"
  head "https://github.com/ashwch/wt.git", branch: "main"

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
