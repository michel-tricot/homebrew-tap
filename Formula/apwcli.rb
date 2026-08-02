class Apwcli < Formula
  desc "Apple Passwords (iCloud Keychain) from the terminal"
  homepage "https://michel-tricot.github.io/apwcli/"
  url "https://files.pythonhosted.org/packages/62/14/3babed2bdff78ea7f900fa8124022ed7762e4932b67bc112bf0dda31b014/apwcli-0.1.0.tar.gz"
  sha256 "eb1d7ffd10766709c4266ac06abd74140f9a6780dc62ef6fdb1b0045af04be6a"
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
