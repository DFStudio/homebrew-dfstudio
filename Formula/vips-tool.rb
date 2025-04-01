class VipsTool < Formula
  desc "A general-purpose vips pipeline tool"
  homepage ""
  url "https://github.com/DFStudio/c-vips-scale/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "dc2460be134a3cef3adab7b79be57a36ffc2fe7be9e0eb250b45789aebbba84c"
  license ""
  version "1.1.2"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "vips"
  depends_on "fmt"
  depends_on "gettext"
  depends_on "docopt"

  def install
    system "cmake", ".", *std_cmake_args
    system "cmake", "--build", ".", "--target", "all"
    bin.install "vips-tool"
  end
end
