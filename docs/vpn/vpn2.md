# vpn2p.tugraz.at

Some of our even more internal services are only reachable via a separate VPN
and 2FA.

## GNOME using OpenConnect 

### Install a TOTP app on your phone

For example andOTP:

* https://f-droid.org/en/packages/org.shadowice.flocke.andotp
* https://play.google.com/store/apps/details?id=org.shadowice.flocke.andotp

### Fetch the OTP key into your app

* Visit https://vpn2p.tugraz.at/tugraz
* Enter your
  * `<tug-username>`
  * `<eduroam-password>`

  ![image](vpn2_otp_login.png){: style="width:400px"}

* Scan the QR code with your app

  ![image](vpn2_otp_setup.jpg){: style="width:400px"}

### Set up the VPN connection in GNOME

`sudo apt install network-manager-openconnect network-manager-openconnect-gnome`

-   Gateway: `vpn2p.tugraz.at/tugraz`
-   Username: `<tug-username>`
-   Password: `<eduroam-password>`
-   VPN Protocol: `Juniper Network Connect`

![image](vpn2_oc.png){: style="width:400px"}

![image](vpn2_config.png){: style="width:400px"}

## Enable the connection

![image](vpn2_login.png){: style="width:400px"}

![image](vpn2_token_input.png){: style="width:400px"}
