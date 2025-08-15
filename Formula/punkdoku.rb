class Punkdoku < Formula
    desc "Sudoku for punks"
    homepage "https://github.com/daypunk/punkdoku"
    version "v1.1.3"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/daypunk/punkdoku/releases/download/v1.1.3/punkdoku-macos-arm64"
        sha256 "e5d753ef3a1da87cb05b8bec2fa9b84de5a68d273d54c421d51cdc4360669e85"
      else
        url "https://github.com/daypunk/punkdoku/releases/download/v1.1.3/punkdoku-macos-amd64"
        sha256 "85b446a9775709edeee8ba2f71de9a2e07e3a61c9efebb9528bc779d709f3bf7"
      end
    end
  
    on_linux do
      url "https://github.com/daypunk/punkdoku/releases/download/v1.1.3/punkdoku-linux"
      sha256 "bb87a5646729ccb91874298927ed81ac657bcac827521404a54205cce679f3b7"
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