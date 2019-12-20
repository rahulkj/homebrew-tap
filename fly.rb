class Fly < Formula
  desc     "Concourse Product - fly cli"
  homepage "https://github.com/concourse/concourse"
  version  "5.5.7"
  url      "https://github.com/concourse/concourse/releases/download/v#{version}/fly-#{version}-darwin-amd64.tgz"
  sha256   "d2694c06219f764f8d9572289a30d595c220ebec36f7fe0f76cdf336097fff6a"

  depends_on :arch => :x86_64

  def install
    bin.install "fly"
  end

  test do
    system "#{bin}/fly", "version"
  end
end
