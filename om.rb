class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "7.8.0"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin-#{version}.tar.gz"
  sha256   "cc26cc1fb1f5cca1b98c86c67fe1b1035f2dfb7b3ceb110cceede301899c5608"

  depends_on :arch => :x86_64

  def install
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
