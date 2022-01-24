class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud interactions"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.8.0.tar.gz"
  sha256 "4c8f1153484dbc47cec93278410bd3e62f1b0f2a3c46f22102d0caec2ca4b3b0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.8.0"
    rebuild 1
    sha256 cellar: :any,                 big_sur:      "671c2d0c882056d1e31b8db4a3fec76a20e2f7a72d0e0b95dd763ab90d421343"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3523c79ed645aacfdc32ba4ef728c26caf88b3e465e1cc428dff6c341ca1962e"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"

  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "wash", "-V"
  end
end
