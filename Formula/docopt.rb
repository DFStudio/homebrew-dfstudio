class Docopt < Formula
  desc "C++11 port of docopt"
  homepage ""
  url "https://github.com/docopt/docopt.cpp/archive/400e6dd8e59196c914dcc2c56caf7dae7efa5eb3.tar.gz"
  sha256 "bc62e9112639ed88f9444a52676f1497cde9b235097cfe807cf1b2f53318666d"
  license "BSL-1.0"
  version "0.6.3"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test docopt`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
