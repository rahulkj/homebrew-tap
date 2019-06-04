class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "v1.1.0"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin"
  sha256   "f3832d8966dd39f7ae1316195ebb379cf18aece281bc2f7c43dd799130ebf460"

  depends_on :arch => :x86_64

  def install
    bin.install "om-darwin" => "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
