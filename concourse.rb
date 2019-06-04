class Concourse < Formula
  desc     "Concourse Product - concourse cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "5.2.0"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/concourse-#{version}-darwin-amd64.tgz"
  sha256   "d0f9e00c47936ca88c439872f76662f625510a5ed8838d758e18ac214e2c4ec4"

  depends_on :arch => :x86_64

  def install
    bin.install "bin/concourse"
  end

  test do
    system "#{bin}/concourse", "version"
  end
end
