class VipsScale < Formula
  desc "A utility for creating JPEG image previews using the C bindings to the VIPS image processing library"
  homepage ""
  url "https://github.com/DFStudio/c-vips-scale/archive/fbc2740cd19158a84e71a95eaa24240f1d31e00a.tar.gz"
  sha256 "156059fc85e7a4aeafd58164d7f3a34f030127c701c4e816b91bba93bc2bb2e8"
  license ""
  version "1.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "vips"
  depends_on "gettext"
  depends_on "docopt"

  def install
    system "cmake", ".", *std_cmake_args
    system "cmake", "--build", ".", "--target", "all"
    bin.install "vips-scale"
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
