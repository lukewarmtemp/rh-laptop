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

# Disable Wifi Powersave
RUN mkdir -p /etc/NetworkManager/conf.d && \
    echo -e "[connection]\nwifi.powersave = 2" > /etc/NetworkManager/conf.d/wifi-powersave-off.conf

