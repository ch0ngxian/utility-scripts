class Heycx < Formula
  desc "Opinionated utility toolkit that makes developer life better"
  homepage "https://github.com/ch0ngxian/homebrew-heycx"
  url "https://github.com/ch0ngxian/homebrew-heycx/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "f50c0ed614eef4f61829fb0ea1c20899427bd46263f4954e713f58b7fa990551"
  license "MIT"
  version "1.2.2"

  def install
    bin.install "heycx"
  end

  def caveats
    <<~EOS
      heycx - Opinionated utility toolkit

      Commands:
        heycx hotfix start [name]  Start a new hotfix branch
        heycx hotfix finish        Complete hotfix (merge to master & develop)
        heycx pr create            Create a GitHub pull request
        heycx sync                 Update master & develop branches

      Note: 'heycx hotfix finish' uses gh CLI for deployment triggers.
      Run 'gh auth login' if not already authenticated.
    EOS
  end

  test do
    assert_match "heycx", shell_output("#{bin}/heycx --help")
    assert_match version.to_s, shell_output("#{bin}/heycx --version")
  end
end
