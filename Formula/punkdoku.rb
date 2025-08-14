class Punkdoku < Formula
    desc "Sudoku for punks"
    homepage "https://github.com/daypunk/punkdoku"
    version "v1.0.9"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/daypunk/punkdoku/releases/download/v1.0.9/punkdoku-macos-arm64"
        sha256 "6c600e62ab1f3c1b04201cd031407da53623593d27ac7f9abef56d8956048ecb"
      else
        url "https://github.com/daypunk/punkdoku/releases/download/v1.0.9/punkdoku-macos-amd64"
        sha256 "d0cefdf14fb744342c5eed298c87d28574296973fadbddca8359d6955f9aa98e"
      end
    end
  
    on_linux do
      url "https://github.com/daypunk/punkdoku/releases/download/v1.0.9/punkdoku-linux"
      sha256 "d8134da1240a4f8a5c45c3e5f73c11c9143a44ef989f86def466d467ec6207da"
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