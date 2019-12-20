class Concourse < Formula
  desc     "Concourse Product - concourse cli"
  homepage "https://github.com/concourse/concourse"
  version  "5.5.7"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/concourse-#{version}-darwin-amd64.tgz"
  sha256   "2974d5f6b18568d286cdb31c57630f36babe8228766e4aa552f2a00095179002"

  depends_on :arch => :x86_64

  def install
    bin.install "bin/concourse"
  end

  test do
    system "#{bin}/concourse", "version"
  end
end
