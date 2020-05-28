class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "5.0.0"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin-#{version}.tar.gz"
  sha256   "3224ed7d93318f843248aaa921a9b5f4ebc6c596833d3eb4d4b50b69a30c29ec"

  depends_on :arch => :x86_64

  def install
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
