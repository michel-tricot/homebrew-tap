class Bearcli < Formula
  desc "The missing open-source CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/74/4a/7ff2885dbf94c2606fec200dfa3670a98735a838ad06ae33231ad2f98b8a/bearcli-1.7.4.tar.gz"
  sha256 "ea5593594605b7a44b2a7e3ba8fd399f472f34723e625d8ba3fe9788cce9eaca"
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
