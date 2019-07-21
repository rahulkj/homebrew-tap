class Fly < Formula
  desc     "Concourse Product - fly cli"
  homepage "https://github.com/concourse/concourse"
  version  "5.4.0"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/fly-#{version}-darwin-amd64.tgz"
  sha256   "c4f25dccfc9535b57ac3bdbb01a455f676749e4962589c52fb6c82a0ce53af71"

  depends_on :arch => :x86_64

  def install
    bin.install "fly"
  end

  test do
    system "#{bin}/fly", "version"
  end
end
