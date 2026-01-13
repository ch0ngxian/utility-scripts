class Heycx < Formula
  desc "Opinionated utility toolkit that makes developer life better"
  homepage "https://github.com/ch0ngxian/homebrew-heycx"
  url "https://github.com/ch0ngxian/homebrew-heycx/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "ba01f962f8b1e7ead0e4db2ce53ef90310c371caeb421e5d4b29b5f839d3e53f"
  license "MIT"
  version "1.0.2"

  bottle do
    root_url "https://github.com/ch0ngxian/homebrew-heycx/releases/download/v1.0.2"
    sha256 cellar: :any_skip_relocation, all: "e131bc24af5e2c874cd5478e8a2d00cebdb2913468fc718d21abfe2b106207b8"
  end

  def install
    bin.install "heycx"
  end

  def caveats
    <<~EOS
      heycx - Opinionated utility toolkit

      Commands:
        heycx hotfix start     Start a new hotfix branch
        heycx hotfix finish    Complete hotfix (merge to master & develop)
        heycx sync             Update master & develop branches

      Note: 'heycx hotfix finish' uses gh CLI for deployment triggers.
      Run 'gh auth login' if not already authenticated.
    EOS
  end

  test do
    assert_match "heycx", shell_output("#{bin}/heycx --help")
    assert_match version.to_s, shell_output("#{bin}/heycx --version")
  end
end
