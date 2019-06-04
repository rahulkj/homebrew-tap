class Concourse < Formula
  desc     "Concourse Product - concourse cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "5.2.0"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/concourse-#{version}-darwin-amd64.tgz"
  sha256   "91e1d86621165fda49eb9c535d3e70fae3bb4cac"

  depends_on :arch => :x86_64

  def install
    bin.install "concourse"
  end

  test do
    system "#{bin}/concourse", "version"
  end
end
