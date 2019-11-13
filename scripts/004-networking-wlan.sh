#!/bin/sh

set -eux

echo 'brcmfmac' >> /etc/modules

apk add wpa_supplicant wireless-tools wireless-regdb iw
sed -i \
    -e '/^wpa_supplicant_args=/s/-u -Dwext,nl80211 \?//g' \
    -e '/^wpa_supplicant_args=/s/="/="-u -Dwext,nl80211 /' \
    -e '/^wpa_supplicant_args=/s/ \+"/"/' \
    /etc/conf.d/wpa_supplicant

rc-update add wpa_supplicant default

# todo needs to be idempotent
cat <<'EOF' >> /etc/network/interfaces
auto wlan0
iface wlan0 inet dhcp
EOF

cat <<EOF > /boot/wpa_supplicant.conf
network={
 ssid="SSID"
 psk="PASSWORD"
}
EOF
