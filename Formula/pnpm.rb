class Pnpm < Formula
  require "language/node"

  desc "📦🚀 Fast, disk space efficient package manager"
  homepage "https://pnpm.js.org"
  url "https://registry.npmjs.org/pnpm/-/pnpm-6.2.4.tgz"
  sha256 "f605a7a14d4dca4fb74a21b03d69b5d7adb627fe53bf89b045d855870741ea33"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "c5db9b0e87c6c66f8a4cc32f5b6b9c74db34bfa9c2a693f248e4c7869a5c75bc"
    sha256 cellar: :any_skip_relocation, big_sur:       "31d5e21c1089c59f1e49e28badeceab94697e3a012bd09c85e033b6fd23f294c"
    sha256 cellar: :any_skip_relocation, catalina:      "31d5e21c1089c59f1e49e28badeceab94697e3a012bd09c85e033b6fd23f294c"
    sha256 cellar: :any_skip_relocation, mojave:        "31d5e21c1089c59f1e49e28badeceab94697e3a012bd09c85e033b6fd23f294c"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/pnpm", "init", "-y"
    assert_predicate testpath/"package.json", :exist?, "package.json must exist"
  end
end
