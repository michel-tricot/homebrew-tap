class Bearcli < Formula
  desc "The missing open-source CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/11/0f/f528b6e0a7e48a10cafbcd24b742a6583769bb86fae52d173003076f38fd/bearcli-1.7.0.tar.gz"
  sha256 "21e91b4d6fcf578ffaa53462a39f845ca24ceb744ce7995c702ebfd1ffe0f9b4"
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
