class YtPlaylist < Formula
  desc "CLI tool for extracting and querying YouTube playlist metadata"
  homepage "https://github.com/brkn/yt-playlist"
  url "https://github.com/brkn/yt-playlist/releases/download/v0.1.3/yt_playlist_macos_arm64"
  version "0.1.3"
  sha256 "8b6167e9791892ae2c6f8677d2e5e649c74797a075a6575f8a6a34e515a667ed"
  license "MIT"

  depends_on "yt-dlp"

  def install
    bin.install "yt_playlist_macos_arm64" => "yt_playlist"
  end

  test do
    assert_match "Usage: yt_playlist <url|db_path>", shell_output("#{bin}/yt_playlist", 1)
  end
end
