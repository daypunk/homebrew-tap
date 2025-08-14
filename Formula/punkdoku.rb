class Punkdoku < Formula
    desc "Sudoku for punks"
    homepage "https://github.com/daypunk/punkdoku"
    version "v1.0.8"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/daypunk/punkdoku/releases/download/v1.0.8/punkdoku-macos-arm64"
        sha256 "c4b05b97a2121fe9227af86559e5f7c7bc1564392b99745c99ea3de0ef3c74f6"
      else
        url "https://github.com/daypunk/punkdoku/releases/download/v1.0.8/punkdoku-macos-amd64"
        sha256 "4613484530d4ed5cb7aaa84a9aa9659c817456c738e55409c0d470519df262f1"
      end
    end
  
    on_linux do
      url "https://github.com/daypunk/punkdoku/releases/download/v1.0.8/punkdoku-linux"
      sha256 "1d80c47a48793f7bfc13e6f0cb7d84fe6600721a8a9c60f7d194cf017b6aaf50"
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