class Punkdoku < Formula
    desc "Sudoku for punks"
    homepage "https://github.com/daypunk/punkdoku"
    version "v1.1.1"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/daypunk/punkdoku/releases/download/v1.1.1/punkdoku-macos-arm64"
        sha256 "e341481acb6c5257034a8466ed46b1a47aee4577feca6d68aa79da007e04e499"
      else
        url "https://github.com/daypunk/punkdoku/releases/download/v1.1.1/punkdoku-macos-amd64"
        sha256 "489482f85eb811ec4739a776125e63e2c9acf112bb47cc3999f8758b180e3905"
      end
    end
  
    on_linux do
      url "https://github.com/daypunk/punkdoku/releases/download/v1.1.1/punkdoku-linux"
      sha256 "9bf68e848ebe1f349b0f4be7f94974c002a546ad60b8f425704c3fe5890a784e"
    end
  
    def install
      bin.install "punkdoku-macos-arm64" => "punkdoku" if OS.mac? && Hardware::CPU.arm?
      bin.install "punkdoku-macos-amd64" => "punkdoku" if OS.mac? && Hardware::CPU.intel?
      bin.install "punkdoku-linux" => "punkdoku" if OS.linux?
    end
  
    test do
      system "#{bin}/punkdoku", "--help"
    end
  end  