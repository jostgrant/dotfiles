sudo dnf update

sudo dnf install emacs sbcl clojure racket racket-devel racket-doc racket-minimal racket-collects guile guile-devel guile-cairo guile-cairo-devel

sudo dnf groupinstall "RPM Development Tools" "Development Tools" "System Tools" "Headless Management" "Network Servers" "Administration Tools" "Editors" "C Development Tools and Libraries" "D Development Tools and Libraries"  

sudo dnf copr enable pp3345/gnome-with-patches 

sudo dnf copr enable mizuo/plata-theme 

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf upgrade

sudo dnf remove cockpit\*

sudo dnf install gnome-tweaks yaru-theme plata-theme papirus-icon-theme 

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install --skip-broken gstreamer1-libav gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer-ffmpeg gstreamer-plugins-bad gstreamer-plugins-bad-free gstreamer-plugins-bad-nonfree gstreamer-plugins-base gstreamer-plugins-espeak gstreamer-plugins-fc gstreamer-plugins-good gstreamer-plugins-ugly gstreamer-rtsp amrnb amrwb faac faad2 flac lame libdca libmad libmatroska x264 x265 xvidcore

sudo dnf install --skip-broken NetworkManager-tui tmux htop nano irssi exfat-utils fuse-exfat hugo syncthing syncthing-gtk simple-scan deja-dup gnome-tweak-tool gnome-clocks gnome-weather tilix thunderbird code borgbackup lm_sensors mosh gnome-logs epiphany 

# Explicity state packages from Silverblue; Because flathub gnome-apps aren't working in 30.
sudo dnf install gnome-clocks gnome-calculator gnome-boxes gimp gedit gnome-books gnome-documents gnome-mpv polari libreoffice libreoffice-base gnome-maps lollypop gnome-hexgl gnome-firmware gnome-usage gnome-builder glade gitg gnome-sharp

# Install to host-system; But eventually these will be installed just in a podman / fedora-toolbox instance.
sudo dnf install --skip-broken hugo nano cmake git gcc-c++ libXext-devel libgudev gtk+-devel wxGTK3-devel systemd-devel openal-soft-devel libevdev-devel libao-devel SOIL-devel libXrandr-devel pulseaudio-libs-devel bluez-libs-devel libusb-devel libevdev\* libXScrnSaver meson llvm lldb clang cmake gcc-gnat boost ghc haskell-platform ocaml opam npm @development-tools @development-tools @gnome-software-development gtk3-devel gstreamer-devel clutter-devel webkitgtk4-devel libgda-devel gobject-introspection-devel gtk3-devel-docs gstreamer-devel-docs clutter-doc gcc-c++ gtkmm30-devel gstreamermm-devel cluttermm-devel webkitgtk4-devel libgdamm-devel gtkmm30-doc gstreamermm-doc python pygobject2 vala vala-devel vala-tools vala-doc vala vala-devel vala-tools vala-doc git qemu qemu-kvm  gcc openssl-devel java-11\* java-1.8\* openjfx\*  libunwind-devel sqlite-devel libfixposix libfixposix-devel glib-networking gsettings-desktop-schemas xclip dbus-x11 numpy scipy webkit2gtk3-devel webkit2gtk3 info texinfo acpi

sudo dnf install mesa-\* xorg-x11-server\* xcb\* SDL2\* allegro5\* vulkan-devel\* bullet bullet-extras bullet-devel bullet-extras-devel rlwrap dmenu

sudo dnf copr enable @dotnet-sig/dotnet
sudo dnf install dotnet mono-devel nant nunit monodevelop 

sudo dnf install virt-manager dosbox wine WoeUSB #playonlinux 

sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install --skip-broken blender godot godot-headless godot-server godot-runner ardour5 musescore audacity inkscape filezilla transmission-gtk obs-studio gnome-mpv mpv ffmpeg youtube-dl streamlink vlc chromium google-chrome feh scrot

# Add Static Site Hosting.
sudo dnf install hugo rubygem-jekyll\*  gem

#change to uninstall
sudo dnf remove rhythmbox

# Limited Flatpak / Flathub Stuff.

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists winepak https://dl.winepak.org/repo/winepak.flatpakrepo
flatpak remote-add --from org.mozilla.FirefoxRepo https://firefox-flatpak.mojefedora.cz/org.mozilla.FirefoxRepo.flatpakrepo

flatpak install org.mypaint.MyPaint de.wolfvollprecht.UberWriter com.moonlight_stream.Moonlight com.valvesoftware.Steam org.libretro.RetroArch tv.kodi.Kodi com.spotify.Client com.wire.WireDesktop org.telegram.desktop com.slack.Slack org.signal.Signal chat.rocket.RocketChat org.zulip.Zulip nz.scuttlebutt.Patchwork im.riot.Riot im.gitter.Gitter net.jami.Jami com.mattermost.Desktop  com.discordapp.Discord  com.github.IsmaelMartinez.teams_for_linux com.uploadedlobster.peek

# Change Ownership To Local Bin Dir.
sudo chown -R jsgrant /usr/local/bin/

# Lisp Dev
mkdir .lisp && cd .lisp
git clone https://github.com/roswell/roswell && cd roswell && ./bootstrap && ./configure && make && sudo make install && ros setup && cd ..
mkdir quicklisp && cd quicklisp && curl -O https://beta.quicklisp.org/quicklisp.lisp && curl -O https://beta.quicklisp.org/quicklisp.lisp.asc && sbcl --load quicklisp.lisp
# in sbcl prompt: (quicklisp-quickstart:install) && (ql:add-to-init-file)
# move contents from ~/quicklisp to ~/.lisp/quicklisp/ 
# update path to ~/.lisp/quimkdir quicklisp && cd quicklisp && curl -O https://beta.quicklisp.org/quicklisp.lisp && curl -O https://beta.quicklisp.org/quicklisp.lisp.asc && sbcl --load quicklisp.lispcklisp/ prefix in .sbclrc
mkdir apps guix
cd apps
## ql:quickload for clx cl-ppcre alexandria for stumpwm
cd apps && git clone https://github.com/stumpwm/stumpwm && cd stumpwm && git clone https://github.com/stumpwm/stumpwm-contrib contrib && ./autogen.sh && ./configure && make && sudo make install #not building, missing install-info

wget -c https://github.com/portacle/portacle/releases/download/1.3b/lin-portacle.tar.xz
wget -c https://ftpmirror.gnu.org/emacs/emacs-26.3.tar.xz
git clone https://git.savannah.gnu.org/git/emacs/elpa.git
git clone https://git.savannah.gnu.org/git/emacs.git emacs-nightly
git clone https://github.com/froggey/Mbuild mbuild
git clone https://github.com/LightTable/LightTable lighttable
git clone https://github.com/oakes/Nightcode nightcode
git clone https://github.com/atlas-engineer/next next-browser

# Ammonite.io
mkdir -p ~/.ammonite && curl -L -o ~/.ammonite/predef.sc https://git.io/vHaKQ
sudo sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/lihaoyi/Ammonite/releases/download/1.9.2/2.13-1.9.2) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm' && amm

# Mill Build
sudo curl -L https://github.com/lihaoyi/mill/releases/download/0.5.5/0.5.5 > /usr/local/bin/mill && sudo chmod +x /usr/local/bin/mill

# SDKMan.io
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install ant
sdk install ceylon
sdk install gaiden
sdk install gradle
sdk install groovy
sdk install kotlin
sdk install kscript
sdk install lazybones
sdk install leiningen
sdk install maven
sdk install sbt
sdk install scala
sdk list java
sdk install java 19.3.0.r11-grl
sdk install java  8.0.232.j9-adpt
sdk install java  8.0.232.hs-adpt
sdk install java 11.0.5.j9-adpt
sdk install java 11.0.5.hs-adpt
sdk install java 13.0.1.j9-adpt
sdk install java 13.0.1.hs-adpt

# Rust Lang ## Add 'source $HOME/.cargo/env' to .bashrc
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default nightly && rustup default stable 
cargo install cargo-download cargo-audit cargo-asm cargo-rpm clippy rustfmt xargo mdbook amethyst_tools

# Wasmer
curl https://get.wasmer.io -sSfL | sh

# NPM
sudo npm install -g gitbook-cli esy 

#### TODO #####
#jmonkeyengine pharo
#minecraft itch


#syncthing setup
#private-internet-access 

#curl https://nixos.org/nix/install | sh
##add 'source /home/jsgrant/.nix-profile/etc/profile.d/nix.sh' to bashrc
#nix-env -i scala sbt dotty coursier apache-maven gradle leiningen boot clojure pharo pharo-launcher rustc
#### TODO #####


#helio.io
cd /usr/local/bin && wget -c https://ci.helio.fm/helio-2.3-x64.tar.gz && tar -xzvf helio-2.3-x64.tar.gz 
sudo ln -s /usr/lib64/libcurl.so.4 /usr/lib64/libcurl-gnutls.so.4


# If Nvidia Based Box.
sudo dnf install nvidia-settings akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda 



