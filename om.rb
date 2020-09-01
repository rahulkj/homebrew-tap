class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "6.2.0"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin-#{version}.tar.gz"
  sha256   "880d2a8b8e826ce34c0ba77a27bafb52203cea82dc5bc6b48e8b4241e97dc187"

  depends_on :arch => :x86_64

  def install
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
