class PipeCleaner < Formula
  desc "A simple tool to briefly open any FIFOs that have a blocking reader/writer"
  homepage "https://github.com/DFStudio/pipe-cleaner"
  url "https://github.com/DFStudio/pipe-cleaner/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7abc1bb1e9eb0675d441bbeaffe3a0b67fb4d77e6a2bf69ddaf31f08d3ef191f"
  license ""
  version "1.0.0"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "cmake", "--build", ".", "--target", "all"
    bin.install "pipe-cleaner"
  end
end
