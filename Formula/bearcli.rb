class Bearcli < Formula
  desc "The missing open-source CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/32/3b/091c4bded31ed1f222ad001c1b5e343b33251ad29660ef684c7b23c309cf/bearcli-1.7.2.tar.gz"
  sha256 "a437b76f8c168cbaeea45babde12f2a0f7bb2eae1fa9722d2045702ce01542d6"
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
