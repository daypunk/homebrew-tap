class Punkdoku < Formula
    desc "Sudoku for punks"
    homepage "https://github.com/daypunk/punkdoku"
    version "v1.1.2"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/daypunk/punkdoku/releases/download/v1.1.2/punkdoku-macos-arm64"
        sha256 "749caa1b093bcc41dafae8e3035d632f47b1af139511b59481555a61e034ffe4"
      else
        url "https://github.com/daypunk/punkdoku/releases/download/v1.1.2/punkdoku-macos-amd64"
        sha256 "3fb5dc4b3569f8375fdf345f8223be9ce770e059ef173fa63a35eed178ebae71"
      end
    end
  
    on_linux do
      url "https://github.com/daypunk/punkdoku/releases/download/v1.1.2/punkdoku-linux"
      sha256 "7e8db888dd29312ab24aa78a8261b3493035f7a3361217dca13e32c8e9c6d3f6"
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