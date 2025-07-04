class AutoUvEnv < Formula
  desc "Automatic UV-based Python virtual environment management"
  homepage "https://github.com/ashwch/auto-uv-env"
  url "https://github.com/ashwch/auto-uv-env/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "b56218f33921d420576781eec6c38cd113cf153e0d4cd5d61c4b6ce3182fb3fd"
  license "MIT"
  head "https://github.com/ashwch/auto-uv-env.git", branch: "main"

  depends_on "uv"

  def install
    bin.install "auto-uv-env"

    # Install shell integration files
    pkgshare.install Dir["share/auto-uv-env/*"]
  end

  def caveats
    <<~EOS
      To activate auto-uv-env, add the following to your shell configuration:

      For Zsh (~/.zshrc):
        source #{HOMEBREW_PREFIX}/share/auto-uv-env/auto-uv-env.zsh

      For Bash (~/.bashrc):
        source #{HOMEBREW_PREFIX}/share/auto-uv-env/auto-uv-env.bash

      For Fish (~/.config/fish/config.fish):
        source #{HOMEBREW_PREFIX}/share/auto-uv-env/auto-uv-env.fish

      Requirements:
        - UV must be installed: https://github.com/astral-sh/uv
        - Python projects must have a pyproject.toml file
    EOS
  end

  test do
    assert_match "auto-uv-env #{version}", shell_output("#{bin}/auto-uv-env --version")
    assert_match "USAGE:", shell_output("#{bin}/auto-uv-env --help")
  end
end
