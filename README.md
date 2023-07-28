# transmission-pia
A docker image for the Transmission bittorrent client with PIA VPN integration

creds.txt should contain PIA username and password on two lines

`
docker run -d --name transmission-pia --mount type=bind,source=creds.txt,target=creds.txt -p 9091:9091 --restart=unless-stopped ghcr.io/grayboltwolf/transmission-pia:main
`
