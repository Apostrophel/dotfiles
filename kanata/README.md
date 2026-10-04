# Kanata install

Run from the root of the dotfiles repo.

```
# 1. Install the binary
curl -L -o /tmp/kanata.zip https://github.com/jtroo/kanata/releases/download/v1.12.0/linux-binaries-x64.zip
unzip /tmp/kanata.zip -d /tmp/kanata-bin
sudo install -m 755 /tmp/kanata-bin/kanata_linux_x64 /usr/local/bin/kanata

# 2. Stow the config and check it
stow -t ~ kanata
kanata --check --cfg ~/.config/kanata/kanata.kbd

# 3. Install and start the service
sudo cp system/kanata.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now kanata
```

To restart kanata after an edit:
```
kanata --check --cfg ~/.config/kanata/kanata.kbd
sudo systemctl restart kanata
```
If the username is not `rig002`, edit the path in `system/kanata.service` before step 3.
