class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "1.2.0"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin"
  sha256   "5edc31d5ee905888be189c172212c4f8120394277f2809cd781150e6647b1cb8"

  depends_on :arch => :x86_64

  def install
    bin.install "om-darwin" => "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
