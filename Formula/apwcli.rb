class Apwcli < Formula
  desc "Apple Passwords (iCloud Keychain) from the terminal"
  homepage "https://michel-tricot.github.io/apwcli/"
  url "https://files.pythonhosted.org/packages/d4/94/d455409a79cfd8c66779dec1cd70eee8c6ddd93316f8a34e80459f7e1bc7/apwcli-0.1.2.tar.gz"
  sha256 "ed5283bf8b8498b44b679c0c080294d92b74afd7af89e0ff5b52ee4c00b522e2"
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
