# System bootloader configuration
bootloader --location=mbr
# Partition clearing information
clearpart --all --initlabel
# Run the Setup Agent on first boot
firstboot --disable
# Activate X
xconfig --startxonboot
# Use network installation
url --url=$tree
# additional repostories get added here
$yum_repo_stanza
# Reboot after installation
reboot
# System keyboard
keyboard us
# System language
lang en_US
# System timezone
timezone  America/Sao_Paulo
# Root password
rootpw --iscrypted $1$IPDXFzNJ$sFxgZCbv0kT3w26ABN/pV0
#firewall --service=ssh
#selinux --disabled
# Install OS instead of upgrade
install
# Clear the Master Boot Record
zerombr
# Allow anaconda to partition the system as needed
autopart

%packages
@base
@base-x
@admin-tools
@authoring-and-publishing
@base
@core
@development-libs
@development-tools
@dial-up
@editors
@education
@electronic-lab
@engineering-and-scientific
@eclipse
@fedora-packager
@fonts
@gnome-desktop
@gnome-software-development
@graphical-internet
@graphics
@hardware-support
@input-methods
@java
@java-development
@kde-desktop
@kde-software-development
@legacy-fonts
@office
@online-docs
@printing
@sound-and-video
@system-tools
@text-internet
@x-software-development
@base-x
kpackagekit
system-config-network
scribus
xfsprogs
mtools
gpgme
gpm
rpmdevtools
koji
mercurial
lua
pylint
rpmlint
plague-client
cmake
mock
bzr
pptp
kdeedu-marble
minicom
opencv
plotutils
openoffice.org-opensymbol-fonts
qtcurve-gtk2
gvfs-obexftp
glibmm24-devel
gnome-vfs2-devel
libsigc++20-devel
libart_lgpl-devel
kdepim
konversation
ImageMagick
digikam
kipi-plugins
kdegraphics
gypsy
gpsd
hdparm
m17n-db-tamil
m17n-db-gujarati
m17n-db-kannada
m17n-db-hindi
gok
m17n-db-oriya
m17n-db-bengali
m17n-contrib-sinhala
m17n-db-assamese
m17n-db-punjabi
iok
m17n-db-telugu
m17n-db-malayalam
xorg-x11-fonts-ISO8859-1-100dpi
urw-fonts
ghostscript-fonts
kdepim
vorbis-tools
amarok
jack-audio-connection-kit
kaffeine
kdemultimedia
gssdp
geoclue
createrepo
radeontool
PackageKit-command-not-found
obexftp
enca
festival
ntpdate
xsel
gupnp
rdesktop
fuse
ncftp
mesa-libGLU-devel
xorg-x11-apps
xscreensaver-gl-extras
gdm
xscreensaver-extras
xscreensaver-base
xterm
xorg-x11-resutils
python-crypto
boost-devel
valgrind
subversion
cvs
perl-ExtUtils-MakeMaker
cscope
ctags
git
kernel-devel
cmake
alsa-lib
libXScrnSaver
qt
qt-x11
pulseaudio
alsa-plugins-pulseaudio
pulseaudio-libs
pulseaudio-libs-glib2
pulseaudio-module-gconf
xine-lib-pulseaudio
pulseaudio-utils
pulseaudio-module-bluetooth
firefox

openssh-server
%end

%post
# create a default user to log in X
useradd fedora
passwd -d fedora

#user --name=fedora --groups=users --password=fedora
#authconfig --enableshadow --passalgo=sha512 --enablefingerprint

# adds the yum repositories to the installed system
#$yum_config_stanza
# cobbler final steps
$SNIPPET('kickstart_done')
%end

