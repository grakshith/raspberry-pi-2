# Raspberry Pi WiFi Hotspot
----
Follow the readme to get the WiFi AP on your Raspberry Pi up and running

## Initial Configuration
Re

Install hostapd\
(On Ubuntu)

````
$ sudo apt-get install hostapd
````

Almost all USB WiFi adapters support the installed version of hostapd.
*Edimax Nano USB EW-7811Un* requires a patched version of hostapd.
The patched version can be found in this repo.
Download that file.

```sh
$ sudo mv /usr/sbin/hostapd /usr/sbin/hostapd.bak
$ sudo mv hostapd /usr/sbin/hostapd.edimax 
$ sudo ln -sf /usr/sbin/hostapd.edimax /usr/sbin/hostapd 
$ sudo chown root.root /usr/sbin/hostapd 
$ sudo chmod 755 /usr/sbin/hostapd
````
If you want to compile hostapd youself, you can download the realtek driver [here] (http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=1&PNid=21&PFid=48&Level=5&Conn=4&DownTypeID=3&GetDown=false) . You will have to navigate to the ~/RTL8188C_8192C_USB_linux_v3.4.4_4749.20121105/wpa_supplicant_hostapd/wpa_supplicant_hostapd-0.8/hostapd and run a **make**, **make install**, then copy hostapd like I did above.

This should complete the initial configuration

---

## Hostapd configuration

```sh
$ sudo nano /etc/hostapd/hostapd.conf
````
Edit the file as follows
````
interface=wlan0
driver=rtl871xdrv
ssid=SSID_NAME
channel=1
wmm_enabled=0
wpa=1
wpa_passphrase=PASSWORD
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
auth_algs=1
macaddr_acl=0
````

## Final configuration

This approach uses a NAT to channel ***wlan0*** traffic through ***eth0***

The respective code blocks can be found in the **wifi.sh** script.

Run the script everytime you want to use the Raspberry Pi as a hotspot







