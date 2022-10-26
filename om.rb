class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "7.8.2"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin-amd64-#{version}.tar.gz"
  sha256   "c6a855d8a5ba2eb8c13b796419eee8d886c3c25db76f9b05394b5117a2f9b971"

  depends_on :arch => :x86_64

  def install
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end