class Blazerepl < Formula
  desc "BlazeDB interactive REPL and database CLI"
  homepage "https://github.com/Mikedan37/BlazeDB"
  url "https://github.com/Mikedan37/BlazeDB/archive/refs/tags/v2.7.6.tar.gz"
  sha256 "33df31f77d6d0493596408d030361892147a23064719c6d91b9f74dcb6d5687a"
  license "MIT"
  head "https://github.com/Mikedan37/BlazeDB.git", branch: "main"

  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--product", "blazedb"
    bin.install ".build/release/blazedb" => "blazedb"
    bin.install_symlink "blazedb" => "blazerepl"
  end

  test do
    output = shell_output("#{bin}/blazedb --help")
    assert_match "blazedb start", output
  end
end
