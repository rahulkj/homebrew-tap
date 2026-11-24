cask "shave" do
  version "0.2.0"

  on_macos do
    on_arm do
      sha256 "e24304b47b395192e96bcdd775e92f5b6878f493b09c21a39fc97359d25d555e"
      url "https://github.com/rahulkj/shave/releases/download/v#{version}/shave-#{version}-darwin-arm64"
      binary "shave-#{version}-darwin-arm64", target: "shave"
    end
    on_intel do
      sha256 "89fb4d017a5b08548def11e50ebbddcfa9a4c3ed074c99c78e4332b3abccac1b"
      url "https://github.com/rahulkj/shave/releases/download/v#{version}/shave-#{version}-darwin-amd64"
      binary "shave-#{version}-darwin-amd64", target: "shave"
    end
  end

  name "shave"
  desc "Trim AI token usage before it reaches the model"
  homepage "https://github.com/rahulkj/shave"

  livecheck do
    skip "Auto-generated on release."
  end

  zap :not_required
end
