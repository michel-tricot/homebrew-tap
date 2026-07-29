class Bearcli < Formula
  desc "The missing open-source CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/37/43/a1387f665d87b9564623c56431ed7290e978a76f4564a676c70d9d64cd4c/bearcli-1.7.3.tar.gz"
  sha256 "c5089328c83796e0c5106732b2535213a95c4133487cd37d713ac95eb14c0fc1"
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
