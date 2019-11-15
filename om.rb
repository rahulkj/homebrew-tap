class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "4.3.0"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin-#{version}.tar.gz"
  sha256   "5c6d3029df170c27c395e412fc3a50e947a36cb57cc0aa5341c7ac70614862da"

  depends_on :arch => :x86_64

  def install
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
