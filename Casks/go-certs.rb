cask "go-certs" do
  version "1.1.0"

  on_macos do
    on_arm do
      sha256 "a661bfca01b644a5cad660238d10c6634b42c13ada826533def1692e36b9e5d6"
      url "https://github.com/rahulkj/go-certs/releases/download/v#{version}/go-certs_#{version}_darwin_arm64.tar.gz"
      binary "go-certs-darwin-arm64", target: "go-certs"
    end
    on_intel do
      sha256 "97b0d8ed2722e62944cb572c5a84fe3296e975b56f3a39d22a3e4ed8ba275990"
      url "https://github.com/rahulkj/go-certs/releases/download/v#{version}/go-certs_#{version}_darwin_amd64.tar.gz"
      binary "go-certs-darwin-x86_64", target: "go-certs"
    end
  end

  name "go-certs"
  desc "Tools to help deal with everything certs"
  homepage "https://github.com/rahulkj/go-certs"

  livecheck do
    skip "Auto-generated on release."
  end

  zap :not_required
end
