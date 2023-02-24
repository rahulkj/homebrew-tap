class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "7.9.0"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin-amd64-#{version}.tar.gz"
  sha256   "3e4845c78c4949911e6a6d8572b582379e5147f5baac50a480c849b0b7f1458b"

  depends_on :arch => :x86_64

  def install
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end