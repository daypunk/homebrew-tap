class Pundoku < Formula
    desc "Sudoku for punks"
    homepage "https://github.com/daypunk/punkdoku"
    version "v1.0.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/daypunk/punkdoku/releases/download/v1.0.0/punkdoku-macos-arm64"
        sha256 "cf5c198587a88859a9f9063d23e330bebc4a3e39ddf44c37871bc6a1b8f42c2c"
      else
        url "https://github.com/daypunk/punkdoku/releases/download/v1.0.0/punkdoku-macos-amd64"
        sha256 "08f8a81ce5e446be3851645a059ec99565e0c225a0062e661eaf0af9b2aa6113"
      end
    end
  
    on_linux do
      url "https://github.com/daypunk/punkdoku/releases/download/v1.0.0/punkdoku-linux"
      sha256 "87bd772c9d90631b8b430db5650219f5ffe39c35cd01365b5688d89b121b9691"
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