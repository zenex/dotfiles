# ─┐ ┬┌─┐┌┐┌┌─┐┌┐ ┬ ┬┌┬┐┌─┐ ─┐ ┬┬ ┬┌─┐
# ┌┴┬┘├┤ ││││ │├┴┐└┬┘ │ ├┤  ┌┴┬┘└┬┘┌─┘
# ┴ └─└─┘┘└┘└─┘└─┘ ┴  ┴ └─┘o┴ └─ ┴ └─┘
# Author:  SENEX @ XENOBYTE.XYZ
# License: MIT License
# Website: https://xenobyte.xyz/projects/?nav=dotfiles
from bs4 import BeautifulSoup
import urllib.request
import re
import sys


# How to use
# ----------

# This script is to be called by a second bash / zsh alias that will call wget on the returned list
# of found media. If you're using zsh simply add the following script to .zshrc
# imgdl() {
#     if [ ! -d $IMGBOARD_DL_DIR ]; then
#         mkdir $IMGBOARD_DL_DIR;
#     fi
#     rm -rf $IMGBOARD_DL_DIR/*;
#     cd $IMGBOARD_DL_DIR;
#     python3 $SCRIPTS_DIR"download_images.py" $1 | xargs wget;  # Path to script
# }
# This script will download all then media that matches the find_all substring and donwloads them
# to the specified folder.

if __name__ == "__main__":

    assert len(sys.argv) == 2, "Invalid number of arguments"
    url = sys.argv[1]
    con = urllib.request.urlopen(urllib.request.Request(
        url, headers={'User-Agent': "Magic Browser"}))
    html = BeautifulSoup(con.read(), "html.parser")
    img_list = []

    # Remove the initial '//' in the href (used by 4chan and some free imageboard engines)
    for a in html.find_all("a", {"href": re.compile("([-\w]+\.(?:bmp|jpeg|jpg|gif|png|webm|pdf|epub))")}):
        m = str.replace(a["href"], "//", "")
        if m not in img_list:
            img_list.append(m)
    # Print (parse) the processed list of found media to wget
    print("\n".join(set(img_list)))
