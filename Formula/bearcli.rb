class Bearcli < Formula
  desc "The missing open-source CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/22/e0/ee4f6c48ca66fb724a34047f484ff3f7c24964877fdff8aa7fc09d56cb0e/bearcli-1.7.5.tar.gz"
  sha256 "b03c6d07e074141b9d684fc257e807b64d4d6649a5cf6a87df7a5c23b57e68f0"
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
