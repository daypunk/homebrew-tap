class Punkdoku < Formula
    desc "Sudoku for punks"
    homepage "https://github.com/daypunk/punkdoku"
    version "v1.0.7"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/daypunk/punkdoku/releases/download/v1.0.0/punkdoku-macos-arm64"
        sha256 "8342e31bedfd1620676abaeca5d758b68979a1f9d20e542bb961244f9e77f4ae"
      else
        url "https://github.com/daypunk/punkdoku/releases/download/v1.0.0/punkdoku-macos-amd64"
        sha256 "8342e31bedfd1620676abaeca5d758b68979a1f9d20e542bb961244f9e77f4ae"
      end
    end
  
    on_linux do
      url "https://github.com/daypunk/punkdoku/releases/download/v1.0.0/punkdoku-linux"
      sha256 "8342e31bedfd1620676abaeca5d758b68979a1f9d20e542bb961244f9e77f4ae"
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