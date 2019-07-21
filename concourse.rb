class Concourse < Formula
  desc     "Concourse Product - concourse cli"
  homepage "https://github.com/concourse/concourse"
  version  "5.4.0"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/concourse-#{version}-darwin-amd64.tgz"
  sha256   "3cdd1351512ab15607002035c410b2e59109d265789cbb9e40aa4c4797bdd576"

  depends_on :arch => :x86_64

  def install
    bin.install "bin/concourse"
  end

  test do
    system "#{bin}/concourse", "version"
  end
end
