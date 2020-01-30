class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "4.4.2"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin-#{version}.tar.gz"
  sha256   "38497a6048c4ca26fb06fbf43fa9115975b27a4b5435b10dfca3cbd00ba7811e"

  depends_on :arch => :x86_64

  def install
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
