class Vimv < Formula
  desc "Terminal-based mass file renaming utility using Vim"
  homepage "https://github.com/thameera/vimv"
  url "https://raw.githubusercontent.com/thameera/vimv/0fec5140eeed8bba5637a9d124bf0364f010e612/vimv"
  version "0fec5140eeed8bba5637a9d124bf0364f010e612"
  sha256 "809e74b1dd00bad7a286489cd2e77980452e19cd9fef6d3e9bc98363f439690c"
  license "MIT"

  def install
    bin.install "vimv"
  end

  test do
    (testpath/"rename_editor").write <<~SH
      #!/bin/bash
      sed -i '' 's/$/.renamed/' "$1"
    SH
    chmod 0755, testpath/"rename_editor"
    ENV["EDITOR"] = (testpath/"rename_editor").to_s

    (testpath/"file1.txt").write("")
    (testpath/"file2.txt").write("")

    system bin/"vimv", "file1.txt", "file2.txt"

    assert_path_exists testpath/"file1.txt.renamed"
    assert_path_exists testpath/"file2.txt.renamed"
  end
end
