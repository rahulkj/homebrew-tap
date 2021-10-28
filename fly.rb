class Fly < Formula
  desc     "Concourse Product - fly cli"
  homepage "https://github.com/concourse/concourse"
  version  "7.6.0"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/fly-#{version}-darwin-amd64.tgz"
  sha256   "b3aabdb93233e987b6001482cae4e2ced7614f6cf2fb01e7bf87e9f9692f44dd"

  depends_on :arch => :x86_64

  def install
    bin.install "fly"
  end

  test do
    system "#{bin}/fly", "version"
  end
end