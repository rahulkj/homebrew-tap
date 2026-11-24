cask "setup-gh-secrets" do
  version "0.1.0"

  on_macos do
    on_arm do
      sha256 "dfe7561ab0965c98dbaa5cc0352d458b15a3f8bc3fc034b078e533e32fb2ae28"
      url "https://github.com/rahulkj/setup-gh-secrets/releases/download/v#{version}/setup-gh-secrets-v#{version}-darwin-arm64"
      binary "setup-gh-secrets-v#{version}-darwin-arm64", target: "setup-gh-secrets"
    end
    on_intel do
      sha256 "0db59047cd1ec142c2f0a5ce76a0ca6bde84d5cc62dee8e29216c8cc32e653e0"
      url "https://github.com/rahulkj/setup-gh-secrets/releases/download/v#{version}/setup-gh-secrets-v#{version}-darwin-amd64"
      binary "setup-gh-secrets-v#{version}-darwin-amd64", target: "setup-gh-secrets"
    end
  end

  name "setup-gh-secrets"
  desc "Configure GitHub Actions secrets and variables from an .envrc file"
  homepage "https://github.com/rahulkj/setup-gh-secrets"

  livecheck do
    skip "Auto-generated on release."
  end

  zap :not_required
end
