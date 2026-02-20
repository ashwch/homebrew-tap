class EwBeta < Formula
  desc "Fix failed shell commands and search command history using natural language"
  homepage "https://github.com/ashwch/ew"
  version "0.0.1-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ashwch/ew/releases/download/v0.0.1-beta.1/ew_v0.0.1-beta.1_darwin_arm64.tar.gz"
      sha256 "2124b1e5c2ab5572bfd2375255b7c011d0838f21c0bc190941abbe3f4c3ccca7"
    else
      url "https://github.com/ashwch/ew/releases/download/v0.0.1-beta.1/ew_v0.0.1-beta.1_darwin_amd64.tar.gz"
      sha256 "32ea98c7976ece505f1ceea3059690ca0f1d253d7d43a84f680a9e07a1607a89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ashwch/ew/releases/download/v0.0.1-beta.1/ew_v0.0.1-beta.1_linux_arm64.tar.gz"
      sha256 "472117727d8885b585f4b54d11980a67983fb8ed3ae5d45d31b517da0cdfa461"
    else
      url "https://github.com/ashwch/ew/releases/download/v0.0.1-beta.1/ew_v0.0.1-beta.1_linux_amd64.tar.gz"
      sha256 "e05dab91b87abe3d45f229c10203f75544bb3199368ea6b1ac31acab7da27092"
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
