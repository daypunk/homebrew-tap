class Punkdoku < Formula
    desc "Sudoku for punks"
    homepage "https://github.com/daypunk/punkdoku"
    version "v1.1.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/daypunk/punkdoku/releases/download/v1.1.0/punkdoku-macos-arm64"
        sha256 "814379450d05dff07eeaed6c05bcfc3d939f6ee8a4b802d0bc7b0a6821c59558"
      else
        url "https://github.com/daypunk/punkdoku/releases/download/v1.1.0/punkdoku-macos-amd64"
        sha256 "1752d617ce888a7814a1a1a7a55b3ad2021428a35d1c8b8e83b00a1ce7d78c44"
      end
    end
  
    on_linux do
      url "https://github.com/daypunk/punkdoku/releases/download/v1.1.0/punkdoku-linux"
      sha256 "b20bf806de7d16993136fd03c4372593e3e9c5735c900cf12eb644f7d584f07c"
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