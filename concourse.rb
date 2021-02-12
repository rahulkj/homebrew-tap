class Concourse < Formula
  desc     "Concourse Product - concourse cli"
  homepage "https://github.com/concourse/concourse"
  version  "6.7.5"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/concourse-#{version}-darwin-amd64.tgz"
  sha256   "0315f91cd0e2d1e7bfdfb17f2e98c1714fe87b9f28eb830995300e9ee068562d"

  depends_on :arch => :x86_64

  def install
    bin.install "bin/concourse"
  end

  test do
    system "#{bin}/concourse", "version"
  end
end