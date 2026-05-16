class Blazerepl < Formula
  desc "BlazeDB interactive REPL and database CLI"
  homepage "https://github.com/Mikedan37/BlazeDB"
  version "2.7.6"
  license "MIT"
  head "https://github.com/Mikedan37/BlazeDB.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/Mikedan37/homebrew-blazedb/releases/download/v2.7.6-1/blazerepl-macos-arm64.tar.gz"
      sha256 "d561723adfdc0735ed33a33818f92b5a9f537db89c48bffcabdd010c5ce4aa65"
    end
  end

  on_linux do
    url "https://github.com/Mikedan37/BlazeDB/archive/refs/tags/v2.7.6.tar.gz"
    sha256 "33df31f77d6d0493596408d030361892147a23064719c6d91b9f74dcb6d5687a"
    depends_on "swift" => :build
  end

  def install
    if OS.linux?
      ENV["SWIFTPM_DISABLE_SANDBOX"] = "1"
      system "swift", "build", "-c", "release", "--product", "blazedb"
      bin.install ".build/release/blazedb" => "blazedb"
    else
      bin.install "blazedb"
    end
    bin.install_symlink "blazedb" => "blazerepl"
  end

  test do
    output = shell_output("#{bin}/blazedb --help")
    assert_match "blazedb start", output
  end
end
