class Fly < Formula
  desc     "Concourse Product - fly cli"
  homepage "https://github.com/concourse/concourse"
  version  "6.6.0"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/fly-#{version}-darwin-amd64.tgz"
  sha256   "178d5214e732bf4dea8676fec4ca6fd9437a5510bd1032bda47cca37e17a3f87"

  depends_on :arch => :x86_64

  def install
    bin.install "fly"
  end

  test do
    system "#{bin}/fly", "version"
  end
end