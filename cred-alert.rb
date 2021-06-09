class CredAlert < Formula
  desc     "Pivotal - cred-alert cli"
  homepage "https://github.com/pivotal-cf/cred-alert"
  version  "2021-06-09-20-24-53"
  url      "https://github.com/pivotal-cf/cred-alert/releases/download/#{version}/cred-alert-cli_darwin"
  sha256   "841b9709df1d028242a226904c6b2e0b46d18667328b8be38df051d120dcdca0"

  depends_on :arch => :x86_64

  def install
    bin.install "cred-alert-cli_darwin" => "cred-alert"
  end

  test do
    system "#{bin}/cred-alert", "version"
  end
end
