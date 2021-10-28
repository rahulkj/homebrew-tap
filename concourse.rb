class Concourse < Formula
  desc     "Concourse Product - concourse cli"
  homepage "https://github.com/concourse/concourse"
  version  "7.6.0"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/concourse-#{version}-darwin-amd64.tgz"
  sha256   "f8ca38575244d4a9aeb086041f045a0c07c8553758669d881c06bdd5e40b15b5"

  depends_on :arch => :x86_64

  def install
    bin.install "bin/concourse"
  end

  test do
    system "#{bin}/concourse", "version"
  end
end