AirVPN scripts for macOS and OpenVPN compiled from source
=========================================================

A bunch of scripts I use to build OpenVPN, to patch **[AirVPN](https://airvpn.org/)** \*.ovpn files and to start a *KillSwitch stolen* from **[Eddie](https://github.com/AirVPN/airvpn-client)**, the AirVPN official client.

### Why?
Because I can and because **Eddie** on macOS is quite a unstable... so to speak.

# Use OpenVPN installed with [Homebrew](https://brew.sh/)

`$ brew install openvpn stunnel`

Add to your `~/.bashrc` or `.bash_profile` or `.zshrc` (if you're using ZSH) the following line:

`export PATH=$(brew --prefix openvpn)/sbin:$PATH`

# Or build OpenVPN from source
Clone the OpenVPN repository (master or checkout a TAG to build stable release).

`$ git clone https://github.com/OpenVPN/openvpn.git`

Install dependencies with [Homebrew](https://brew.sh/)

`$ brew install automake autoconf libtool pkg-config libressl openssl lzo lz4 stunnel`

Call the compiler script `$ ./openvpn-build.sh`

Add to your `~/.bashrc` or `.bash_profile` or `.zshrc` (if you're using ZSH) the following line:

`export PATH="/usr/local/sbin:$PATH"`

###### By default the script compiles with LibreSSL support, if you want OpenSSL instead comment/uncomment the `openvpn-build.sh` script in the appropriate section.

### Note on SSL and macOS

macOS has built in it an old version on SSL, if you want the most recent downloaded with [Homebrew](https://brew.sh/) add to your `~/.bashrc`, `.bash_profile` or `.zshrc` (if you're using ZSH)

`export PATH="/usr/local/opt/openssl/bin:$PATH"`

# Configure ovpn files downloaded from [AirVPN](https://airvpn.org/)

### Patch the ovpn configuration downloaded from AirVPN
The patch add the following 3 lines of code in the .ovpn file you've downloaded from [AirVPN](https://airvpn.org/):

```
script-security 2
up "connect.sh"
down "disconnect.sh"
```

- `script-security 2` allows external scripts to be executed.
- `up "connect.sh"` changes the **DNS** with the one provided by [AirVPN](https://airvpn.org/) - see section DNS LIST - changes the domain name to **openvpn** and start the *PF firewall killswitch**.
- `down "disconnect.sh"` restore **DNS and domain name** to the original one and stops *PF*.

`AirVPN_WhateverIsTheName.ovpn < patch-ovpn.patch`

### Start your OpenVPN

`$ sudo openvpn AirVPN_WhateverIsTheName.ovpn`

# DNS LIST
[AirVPN uses different DNS's depending on the protocol used for the connection](https://airvpn.org/specs/).
Change the `connect.sh` `-setdnsservers` section with the correspondent DNS based on the protocol you've selected on the **configuration page** of your account.
```
Protocol                  IP        DNS
Port 443  - Protocol UDP  10.4.*.*  10.4.0.1
Port 443  - Protocol TCP  10.5.*.*  10.5.0.1
Port 80   - Protocol UDP  10.6.*.*  10.6.0.1
Port 80   - Protocol TCP  10.7.*.*  10.7.0.1
Port 53   - Protocol UDP  10.8.*.*  10.8.0.1
Port 53   - Protocol TCP  10.9.*.*  10.9.0.1
Port 2018 - Protocol UDP  10.30.*.*  10.30.0.1

Port 2018 - Protocol TCP
Port 2018 - Protocol SSH
Port 2018 - Protocol SSL  10.50.*.*  10.50.0.1
```
# Closed Terminal

If you accidentally or voluntarily close the terminal, you can kill the OpenVPN processl later with:

`$ sudo killall -2 openvpn`

Translated in english: kill all **openvpn** processes as they where killed by a keyboard input `CTRL+C`

# Final notes

- Before building a new **OpenVPN** version do a `$ brew upgrade`
- Always check that the DNS script is working on [IPLeak](https://ipleak.net/)
- It works perfectly for me, but in case of doubts I strongly encourage you to ask on **[AirVPN](https://airvpn.org/)** if this method is safe, there are a bunch of nice guys on their forum that will help in case of necessity.
