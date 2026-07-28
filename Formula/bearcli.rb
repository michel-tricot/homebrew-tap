class Bearcli < Formula
  desc "The missing CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/68/41/a4f3e39797308cad3ba10276bd302cc25cfca270fa14d2a04f925a48f718/bearcli-1.6.2.tar.gz"
  sha256 "58156ad0d6107a703e3b6c315877d26610ea5b015eec8ef862402665520b3a21"
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
