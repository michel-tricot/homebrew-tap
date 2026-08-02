class Apwcli < Formula
  desc "Apple Passwords (iCloud Keychain) from the terminal"
  homepage "https://michel-tricot.github.io/apwcli/"
  url "https://files.pythonhosted.org/packages/27/37/ee3c2844b96480ee6252b3ad5de4771ea2bc3c792de96ecdc11b3734d506/apwcli-0.1.1.tar.gz"
  sha256 "0e7eaef77ded05f9722b165eef8b680b4155697642f209dc8a8be1f6dff21f38"
  license "MIT"

  depends_on :macos
  depends_on "python@3.13"

  def install
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", "--clear", libexec
    system libexec/"bin/pip", "install", "--no-compile", "--ignore-installed", buildpath.to_s
    bin.install_symlink libexec/"bin/apwcli"
  end

  test do
    assert_match "Apple Passwords", shell_output("#{bin}/apwcli --help")
  end
end
