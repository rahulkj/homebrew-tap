class CredAlert < Formula
  desc     "Pivotal - cred-alert cli"
  homepage "https://github.com/pivotal-cf/cred-alert"
  version  "2019-03-28-22-27-36"
  url      "https://github.com/pivotal-cf/cred-alert/releases/download/#{version}/cred-alert-cli_darwin"
  sha256   "9cfadb138e4ed610be9c3bdd3b1a4f5e72c483f1797b16c92b6dc0d25ffab004"

  depends_on :arch => :x86_64

  def install
    bin.install "cred-alert-cli_darwin" => "cred-alert"
  end

  test do
    system "#{bin}/cred-alert", "version"
  end
end
