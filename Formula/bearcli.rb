class Bearcli < Formula
  desc "The missing CLI for Bear notes"
  homepage "https://michel-tricot.github.io/bearcli/"
  url "https://files.pythonhosted.org/packages/47/40/23e99b2db0648ec2e16ad5b0dc12b14b3eee08593c38616fe44b89e840ee/bearcli-1.6.1.tar.gz"
  sha256 "1e7214ae576ebe4025c47b9cdca60d3614695a4ea2cf442f1c8b207be891522b"
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
