class YtPlaylist < Formula
  desc "CLI tool for extracting and querying YouTube playlist metadata"
  homepage "https://github.com/brkn/yt-playlist"
  url "https://github.com/brkn/yt-playlist/releases/download/v0.1.2/yt_playlist_macos_arm64"
  version "0.1.2"
  sha256 "85974f998ba106ff76afd63038a2765bb69f15b68f983d2a54b99bbedcf08714"
  license "MIT"

  depends_on "yt-dlp"

  def install
    bin.install "yt_playlist_macos_arm64" => "yt_playlist"
  end

  test do
    assert_match "Usage: yt_playlist <url|db_path>", shell_output("#{bin}/yt_playlist", 1)
  end
end
