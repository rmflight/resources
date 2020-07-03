# borrowed from the Rocker setup at
# https://github.com/rocker-org/rocker-versioned/blob/3d62b38a1310/verse/Dockerfile#L50-L52
wget -qO- "https://github.com/yihui/tinytex/raw/master/tools/install-unx.sh" | sh -s - --admin --no-path
sudo mv ~/.TinyTeX /opt/TinyTeX
sudo /opt/TinyTeX/bin/*/tlmgr path add
sudo tlmgr install metafont mfware inconsolata tex ae parskip listings
sudo tlmgr path add
Rscript -e "source('https://install-github.me/yihui/tinytex'); tinytex::r_texmf()"
sudo chown -R root:staff /opt/TinyTeX
sudo chmod -R g+w /opt/TinyTeX
sudo chmod -R g+wx /opt/TinyTeX/bin