class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "7.8.2"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin-amd64-#{version}.tar.gz"
  sha256   "4c3cefa82ba21b7535cfe58c1588a5f0e59ff85ee789469ee25acf05aef87fbd"

  depends_on :arch => :x86_64

  def install
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end