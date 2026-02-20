class EwATBeta < Formula
  desc "Fix failed shell commands and search command history using natural language"
  homepage "https://github.com/ashwch/ew"
  version "0.0.1-beta.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ashwch/ew/releases/download/v0.0.1-beta.2/ew_v0.0.1-beta.2_darwin_arm64.tar.gz"
      sha256 "cad116d28c9596ecce7030915b33b0d5404e3c4a84681cc08def1e0314574ebf"
    else
      url "https://github.com/ashwch/ew/releases/download/v0.0.1-beta.2/ew_v0.0.1-beta.2_darwin_amd64.tar.gz"
      sha256 "fbd125be9d5f91291cd5f44f1de3905716035bb3767e1765636f917cbaf350fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ashwch/ew/releases/download/v0.0.1-beta.2/ew_v0.0.1-beta.2_linux_arm64.tar.gz"
      sha256 "54eea6191128f1773c5c58ce651e21e3f20f39c5aa2c0cef7d83dbc88de355a2"
    else
      url "https://github.com/ashwch/ew/releases/download/v0.0.1-beta.2/ew_v0.0.1-beta.2_linux_amd64.tar.gz"
      sha256 "1c501bc780ba6d9280216c57cd1fc8b28f2a004b40d2d1c5a528a609257bd9f8"
    end
  end

  def install
    bin.install "ew"
    bin.install "_ew"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ew --version").strip
  end
end
