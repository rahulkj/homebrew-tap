class Fly < Formula
  desc     "Concourse Product - fly cli"
  homepage "https://github.com/concourse/concourse"
  version  "1.1.0"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/fly-#{version}-darwin-amd64.tgz"
  sha256   "ab75abf24209c434d470864c4ab0c3c7fe717c82dbd55a77608be91661d3064a"

  depends_on :arch => :x86_64

  def install
    bin.install "fly"
  end

  test do
    system "#{bin}/fly", "version"
  end
end
