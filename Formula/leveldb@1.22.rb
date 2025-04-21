# Formula/leveldb@1.22.rb
class LeveldbAT122 < Formula
  desc "Key-value storage library with ordered mapping"
  homepage "https://github.com/google/leveldb"
  url "https://github.com/google/leveldb/archive/refs/tags/1.22.tar.gz"
  sha256 "55423cac9e3306f4a9502c738a001e4a339d1a38ffbee7572d4a07d5d63949b2"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    assert_predicate lib/"libleveldb.a", :exist?
    assert_predicate include/"leveldb/db.h", :exist?
  end
end
