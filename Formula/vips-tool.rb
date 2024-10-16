class VipsTool < Formula
  desc "A general-purpose vips pipeline tool"
  homepage ""
  url "https://github.com/DFStudio/c-vips-scale/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "6fdd7c5c7e3ce3111bc59dc02f6fab004f90363158eaa1a9b4365d2b2ac01644"
  license ""
  version "1.1.1"

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

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test vips-tool`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
