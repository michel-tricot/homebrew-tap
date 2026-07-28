class Bearcli < Formula
  desc "The missing CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/e7/39/e166a28dab33825665a72fc835f5204666368080c3363bdb3e9181c87458/bearcli-1.6.3.tar.gz"
  sha256 "a6bd2b4213ef019a12d391d0b0c887e959c35da40e6a83e13629d906e720e6a5"
  license "MIT"

  depends_on "python@3.13"

  def install
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--no-compile", buildpath.to_s
    bin.install_symlink libexec/"bin/bearcli"
  end

  test do
    assert_match "Read notes from the Bear note app", shell_output("#{bin}/bearcli --help")
  end
end
