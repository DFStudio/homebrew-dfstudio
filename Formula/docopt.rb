class Docopt < Formula
  desc "C++11 port of docopt"
  homepage ""
  url "https://github.com/docopt/docopt.cpp/archive/05d507da0d153faff381f44968833ebffdc03447.tar.gz"
  sha256 "3f1a94899db5809cf7191b0e4179ded11d4dd53a811aeac22f26847ccc58ac76"
  license "BSL-1.0"
  version "0.6.4"

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
