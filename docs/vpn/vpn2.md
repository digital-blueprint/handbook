# vpn2p.tugraz.at

Some of our even more internal services are only reachable via a separate VPN
and 2FA.

TU Graz users by default don't have access to this VPN. Please contact ZID
with your account information and information about which services you want to access.

In case you lose your TOTP key please contact the VPN service team or ZID.

## TOTP Setup

### Install a TOTP app on your phone

For example andOTP:

* https://f-droid.org/en/packages/org.shadowice.flocke.andotp
* https://play.google.com/store/apps/details?id=org.shadowice.flocke.andotp

For example Fast 2FA for ios
* https://apps.apple.com/de/app/totp-authenticator-fast-2fa/id1404230533

### Store the TOTP key in your app

* Visit https://vpn2p.tugraz.at/tugraz
* Enter your
  * `<tug-username>`
  * `<eduroam-password>`

  ![image](vpn2_otp_login.png){: style="width:400px"}

* Scan the QR code with your app

  ![image](vpn2_otp_setup.jpg){: style="width:400px"}


## GNOME using OpenConnect 

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


## Using the OpenConnect CLI directly

```console
> sudo openconnect --protocol=pulse vpn2p.tugraz.at/tugraz
Connected to 129.27.200.11:443
SSL negotiation with vpn2p.tugraz.at
Connected to HTTPS on vpn2p.tugraz.at with ciphersuite (TLS1.2)-(ECDHE-SECP256R1)-(RSA-SHA512)-(AES-128-GCM)
Got HTTP response: HTTP/1.1 101 Switching Protocols
Enter user credentials:
Username:christoph_reiter
# enter <eduroam-password> here
Password:
Token code request:
# enter OTP from app here
Secondary password:
Set up UDP failed; using SSL instead
Connected as <IP>, using SSL, with ESP disabled
```