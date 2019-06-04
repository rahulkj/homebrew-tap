class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "1.0.0"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin"
  sha256   "69c4bc3b538fbdb83c5fd6a7bbf2c999293e28d8b895e9d09cd4a7211bce272c"

  depends_on :arch => :x86_64

  def install
    bin.install "om-darwin" => "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
