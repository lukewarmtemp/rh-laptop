# Base image
FROM quay.io/fedora/fedora-silverblue:42

# Add nessecary rpms for VPN
ADD rh-internal-certs.rpm rh-internal-certs.rpm
ADD rh-vpn-profiles.rpm rh-vpn-profiles.rpm

# RH VPN
RUN rpm-ostree install NetworkManager-openvpn \
    NetworkManager-openvpn-gnome \
    rh-internal-certs.rpm \
    rh-vpn-profiles.rpm

# Codecs for firefox
# RUN rpm-ostree install \
#     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
#     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# RUN rpm-ostree override remove gstreamer1-plugins-bad-free
# RUN rpm-ostree install \
#     gstreamer1-plugins-bad-freeworld \
#     gstreamer1-plugins-good \
#     gstreamer1-plugins-ugly \
#     gstreamer1-libav \
#     lame-libs

# Obsidian
RUN rpm-ostree install flatpak
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak install -y flathub md.obsidian.Obsidian

