class Bearcli < Formula
  include Language::Python::Virtualenv

  desc "The missing CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/c1/05/5b9fe7f962be72c55abbb2ef6b0466cf208ca2e73c069fc52c8ac59d57a4/bearcli-1.3.0.tar.gz"
  sha256 "1d1266c780d47531cde91c4810d4989e7d88c7d5cdfebc20624779f8828a7ad7"
  license "MIT"

  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3.13")
    system libexec/"bin/pip", "install", "--no-compile", buildpath.to_s
    bin.install_symlink libexec/"bin/bearcli"
  end

  test do
    assert_match "Read notes from the Bear note app", shell_output("#{bin}/bearcli --help")
  end
end
