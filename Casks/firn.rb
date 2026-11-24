cask "firn" do
  version "0.5.5"

  on_macos do
    on_arm do
      sha256 "598c75025bafe23bbe2a5b699f36da06f0355762691ed2e332ea6898c16944ba"
      url "https://github.com/rahulkj/firn/releases/download/v#{version}/firn-v#{version}-darwin-arm64.tar.gz"
    end
    on_intel do
      sha256 "c84ec072e61d1177efeb242d87ab12658ac379dfca271cf602a69fed67d76c64"
      url "https://github.com/rahulkj/firn/releases/download/v#{version}/firn-v#{version}-darwin-amd64.tar.gz"
    end
  end

  name "firn"
  desc "Event broker with streaming and queue semantics over a shared log"
  homepage "https://rahulkj.github.io/firn/"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "firn-cli"
  binary "firnd"

  zap :not_required
end
