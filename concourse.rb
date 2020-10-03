class Concourse < Formula
  desc     "Concourse Product - concourse cli"
  homepage "https://github.com/concourse/concourse"
  version  "6.6.0"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/concourse-#{version}-darwin-amd64.tgz"
  sha256   "4ef1bd1b4fc3d775442a1f6d420e1dd659f73e75a55697a3fd93a7e75a6c5d88"

  depends_on :arch => :x86_64

  def install
    bin.install "bin/concourse"
  end

  test do
    system "#{bin}/concourse", "version"
  end
end