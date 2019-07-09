class Om < Formula
  desc     "Pivotal - om cli"
  homepage "https://github.com/pivotal-cf/om"
  version  "2.0.1"
  url      "https://github.com/pivotal-cf/om/releases/download/#{version}/om-darwin"
  sha256   "578235fed7ce64a16d2883f98bc91dbc63aafde1c1bf59664c6fb5edc3814b47"

  depends_on :arch => :x86_64

  def install
    bin.install "om-darwin" => "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
