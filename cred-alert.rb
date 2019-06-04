class CredAlert < Formula
  desc     "Pivotal - cred-alert cli"
  homepage "https://github.com/concourse/concourse"
  version  "2019-03-28-22-27-36"
  url      "https://github.com/pivotal-cf/cred-alert/releases/download/#{version}/cred-alert-cli_darwin"
  sha256   "85c84cb775172e480051b3d7d4f22b60e9b5de964003b874ebf8db72a4ffccdb"

  depends_on :arch => :x86_64

  def install
    bin.install "cred-alert-cli_darwin" => "cred-alert"
  end

  test do
    system "#{bin}/cred-alert", "version"
  end
end
