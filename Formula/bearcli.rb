class Bearcli < Formula
  desc "The missing open-source CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/05/f7/3fb37268d12f2a3bafb89b2d3f8a1d101237b524e14e8954e17271cc70b1/bearcli-1.7.6.tar.gz"
  sha256 "697b322f17e759a93292dd9e18066a4fb4ad0fcc843a2289073aa94307cbb1e4"
  license "MIT"

  depends_on "python@3.13"

  def install
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", "--clear", libexec
    system libexec/"bin/pip", "install", "--no-compile", "--ignore-installed", buildpath.to_s
    bin.install_symlink libexec/"bin/bearcli"
  end

  test do
    assert_match "Read notes from the Bear note app", shell_output("#{bin}/bearcli --help")
  end
end
