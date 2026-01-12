class Heycx < Formula
  desc "Opinionated utility toolkit that makes developer life better"
  homepage "https://github.com/ch0ngxian/homebrew-heycx"
  url "https://github.com/ch0ngxian/homebrew-heycx/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"
  version "1.0.1"

  # git and gh are runtime dependencies but not declared here
  # since they're typically pre-installed and the script handles their absence

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
