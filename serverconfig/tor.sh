#!/bin/bash

# Tor server setup script for Ubuntu 14.04

onionaddress='cyphdbyhiddenbhs.onion'
onionkey='ASK RYAN FOR THIS'
cert='LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tDQpNSUlIalRDQ0JuV2dBd0lCQWdJUUREQUNZRVN2Ni9DY0l5c2NzbnVIOGpBTkJna3Foa2lHOXcwQkFRc0ZBREIxDQpNUXN3Q1FZRFZRUUdFd0pWVXpFVk1CTUdBMVVFQ2hNTVJHbG5hVU5sY25RZ1NXNWpNUmt3RndZRFZRUUxFeEIzDQpkM2N1WkdsbmFXTmxjblF1WTI5dE1UUXdNZ1lEVlFRREV5dEVhV2RwUTJWeWRDQlRTRUV5SUVWNGRHVnVaR1ZrDQpJRlpoYkdsa1lYUnBiMjRnVTJWeWRtVnlJRU5CTUI0WERURTJNREV5TURBd01EQXdNRm9YRFRFM01ERXlOREV5DQpNREF3TUZvd2dmc3hIVEFiQmdOVkJBOE1GRkJ5YVhaaGRHVWdUM0puWVc1cGVtRjBhVzl1TVJNd0VRWUxLd1lCDQpCQUdDTnp3Q0FRTVRBbFZUTVJrd0Z3WUxLd1lCQkFHQ056d0NBUUlUQ0VSbGJHRjNZWEpsTVJBd0RnWURWUVFGDQpFd2MxTmpBd01ETTVNU0l3SUFZRFZRUUpFeGt6TlRBd0lGTnZkWFJvSUVSMWNHOXVkQ0JJYVdkb2QyRjVNUTR3DQpEQVlEVlFRUkV3VXhPVGt3TVRFTE1Ba0dBMVVFQmhNQ1ZWTXhFVEFQQmdOVkJBZ1RDRVJsYkdGM1lYSmxNUTR3DQpEQVlEVlFRSEV3VkViM1psY2pFVE1CRUdBMVVFQ2hNS1EzbHdhQ3dnU1c1akxqRWZNQjBHQTFVRUF4TVdZM2x3DQphR1JpZVdocFpHUmxibUpvY3k1dmJtbHZiakNDQVNJd0RRWUpLb1pJaHZjTkFRRUJCUUFEZ2dFUEFEQ0NBUW9DDQpnZ0VCQU5rNCtIeGhvVFVDNkh0VXBaNjMxSEppRXdXNmZlUFNFNUNYNFVWM3k2V2JxYkk5OUdNTGpvUEhDWFdRDQozMlVJZi85ZW1Ub25IaktQZDg2N1k1SmNKZG90d1JOaFdKN3N3eWt5K2dUZlRVbER6SDVnNy9BdGZEbUZraFJxDQpXaHdvVkFIdjdUN2hxNlpZazdVY2FNR2lyYWRpSjl0SEN4YmVFdnFvbDhwUjRBQVU0SU1FYTFJdm5RY2lrUTRDDQowOGZNYUV1cURuMEhKaDZycVpBS0lZc2hEOEJWTWFlZExPbUtQVUwyVkRSNFNJK3NTeXUvWlVLL3hUd2Y3ZFhpDQp6NEtSV3F0ZUhBMmJZcUdBS2dkQVkxU0JjcjVKa1dxQzRKUzNnN2R2c3Q4V0VrT0MrL2hiR2N5VWs5WW1Jd2luDQo1ckpVUzVLUGg0NjRMemxMUXNkazV0TURlQU1DQXdFQUFhT0NBNUF3Z2dPTU1COEdBMVVkSXdRWU1CYUFGRDNUDQpVS1hXb0szdTgwcGdDbVhUSWRUNCtOWVBNQjBHQTFVZERnUVdCQlRKc04wLzhHc0NQOWRnSlZpcWJMWEJIWUJmDQpTREE3QmdOVkhSRUVOREF5Z2haamVYQm9aR0o1YUdsa1pHVnVZbWh6TG05dWFXOXVnaGdxTG1ONWNHaGtZbmxvDQphV1JrWlc1aWFITXViMjVwYjI0d0RnWURWUjBQQVFIL0JBUURBZ1dnTUIwR0ExVWRKUVFXTUJRR0NDc0dBUVVGDQpCd01CQmdnckJnRUZCUWNEQWpCMUJnTlZIUjhFYmpCc01EU2dNcUF3aGk1b2RIUndPaTh2WTNKc015NWthV2RwDQpZMlZ5ZEM1amIyMHZjMmhoTWkxbGRpMXpaWEoyWlhJdFp6RXVZM0pzTURTZ01xQXdoaTVvZEhSd09pOHZZM0pzDQpOQzVrYVdkcFkyVnlkQzVqYjIwdmMyaGhNaTFsZGkxelpYSjJaWEl0WnpFdVkzSnNNRXNHQTFVZElBUkVNRUl3DQpOd1lKWUlaSUFZYjliQUlCTUNvd0tBWUlLd1lCQlFVSEFnRVdIR2gwZEhCek9pOHZkM2QzTG1ScFoybGpaWEowDQpMbU52YlM5RFVGTXdCd1lGWjRFTUFRRXdnWWdHQ0NzR0FRVUZCd0VCQkh3d2VqQWtCZ2dyQmdFRkJRY3dBWVlZDQphSFIwY0RvdkwyOWpjM0F1WkdsbmFXTmxjblF1WTI5dE1GSUdDQ3NHQVFVRkJ6QUNoa1pvZEhSd09pOHZZMkZqDQpaWEowY3k1a2FXZHBZMlZ5ZEM1amIyMHZSR2xuYVVObGNuUlRTRUV5UlhoMFpXNWtaV1JXWVd4cFpHRjBhVzl1DQpVMlZ5ZG1WeVEwRXVZM0owTUF3R0ExVWRFd0VCL3dRQ01BQXdnZ0YvQmdvckJnRUVBZFo1QWdRQ0JJSUJid1NDDQpBV3NCYVFCMkFLUzVDWkMwR0ZnVWg3c1Rvc3huY0FvOE5aZ0UrUnZmdU9OM3pRN0lEZHdRQUFBQlVtQ2F5NUlBDQpBQVFEQUVjd1JRSWhBTktYTS9CbDZKcU4yRmYwV3pGU0UvSTRzNE9UaFVuc3c0YTJwVmJqYjh4OEFpQi91cDNrDQo2SExQaFA3L2loYmlBd00yL2FNb1lRbHZhZzg4VVJ1OFlhZDVid0IzQUdqMm1QZ2ZaSUsrT296dXVTZ2RUUHh4DQpVVjFuazlSRTBRcG5yTHRQVC92RUFBQUJVbUNheTV3QUFBUURBRWd3UmdJaEFJQTc3Uk5hczFTUDZ2dEJBVzgvDQppUWZ1a1drekdPQVlRMnNNd2FUN3k2NDNBaUVBNnNCT1BOZ1V0REZkRTJhWjBvenJ5WTRHaDkrcUljSUZmSTNQDQp5SENuT29ZQWRnQldGQWFhTDlmQzdOUDE0YjFFc2o3SFJuYTV2SmtSWE1EdmxKaFYxb25RM1FBQUFWSmdtc3hrDQpBQUFFQXdCSE1FVUNJUUM0aUZjMkNZZXNERW5raThDN0J3Qm9WWC9Qc3FXTG0zMjVMTVdUTy9oZ2x3SWdXZ1F1DQp0NlRvNHVhbm5pK1AxcGFma2U3QTlZSTcxSFE5cVNHUFFpZVBjQkV3RFFZSktvWklodmNOQVFFTEJRQURnZ0VCDQpBSmtlZ2d1Wnd2OG11WXdxRzNRVDk5UEtvdUprNDQ5RnA0T1hCU3YwQzFWUlBUaFF1ZDdBaU1mWDNmbjJhTndLDQpaMU96TFJvWTNrRFJwaUJrbXhBazdVWStibmU2S0NvVlpYL2lkdTRBVWNtd2p5ODdSUHFzcTJ4M25LWXFYcEhCDQp2Y1dBTU4vUnVuT2YvKzd3MGVzM25sZmViVTVBZmI2SDlERzMwRytwemlaTTNQNFJFYlF2RXhsQys2NUpIei9YDQpPdFdieTEzV3FyT1hRMVZtWm5MWlUvV0hWd3gyWnZrSGFNQVZZVEdrL3NFY3QxbTJ1VVhERmRndHFvMU1aY2NSDQpVbUViNHh4azNxTDFwV1JxL0dlaktrVy8yT1BvR1R6UDhRd0hCVjhHQ2d3SzBjQ3RvSWpMYjJINWtEdGhSenFZDQpSUFIwWnplSVJpbUFkV2NiaTU2cHVSST0NCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0NCi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLQ0KTUlJRXRqQ0NBNTZnQXdJQkFnSVFESG1wUkxDTUVaVWdrbUZmNG1zZGd6QU5CZ2txaGtpRzl3MEJBUXNGQURCcw0KTVFzd0NRWURWUVFHRXdKVlV6RVZNQk1HQTFVRUNoTU1SR2xuYVVObGNuUWdTVzVqTVJrd0Z3WURWUVFMRXhCMw0KZDNjdVpHbG5hV05sY25RdVkyOXRNU3N3S1FZRFZRUURFeUpFYVdkcFEyVnlkQ0JJYVdkb0lFRnpjM1Z5WVc1ag0KWlNCRlZpQlNiMjkwSUVOQk1CNFhEVEV6TVRBeU1qRXlNREF3TUZvWERUSTRNVEF5TWpFeU1EQXdNRm93ZFRFTA0KTUFrR0ExVUVCaE1DVlZNeEZUQVRCZ05WQkFvVERFUnBaMmxEWlhKMElFbHVZekVaTUJjR0ExVUVDeE1RZDNkMw0KTG1ScFoybGpaWEowTG1OdmJURTBNRElHQTFVRUF4TXJSR2xuYVVObGNuUWdVMGhCTWlCRmVIUmxibVJsWkNCVw0KWVd4cFpHRjBhVzl1SUZObGNuWmxjaUJEUVRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQw0KZ2dFQkFOZFRwQVJSK0ptbUZraExaeWVxazBuUU9lME1zTEFBaC9GbktJYUZqSTVqMnJ5eFFEamkwL1hzcFFVWQ0KdUQwK3haa1hNdXdZalByeERLWmtJWVhMQnhBMHNGS0lLeDlvbTlLeGp4S3dzOUxuaUI4Zjd6aDNWRk5mZ0hrLw0KTGhxcXFCNUxLdzJydDJPNU5iZDlGTHhaUzk5UlN0S2g0Z3ppa0lLSGFxN3ExMlRXbUZYby9hOGFVR3hVdkJIeQ0KL1VyeW5idC9EdlRWdm80V2lSSlYyTUJ4Tk83MjNDM3N4SWNsaG8zWUllU3dUUXlKM0RrbUY5MzIxNVNGMkFRaA0KY0oxdmIvOWN1aG5oUmN0V1Z5aCtIQTFCVjZxM3VDZTdzZVQ2S3U4aEkzVWFyUzJiaGpXTW5IZTFjNjNZbEMzaw0KOHd5ZDdzRk9ZbjRYd0hHZUxON3grUkFvR1RNQ0F3RUFBYU9DQVVrd2dnRkZNQklHQTFVZEV3RUIvd1FJTUFZQg0KQWY4Q0FRQXdEZ1lEVlIwUEFRSC9CQVFEQWdHR01CMEdBMVVkSlFRV01CUUdDQ3NHQVFVRkJ3TUJCZ2dyQmdFRg0KQlFjREFqQTBCZ2dyQmdFRkJRY0JBUVFvTUNZd0pBWUlLd1lCQlFVSE1BR0dHR2gwZEhBNkx5OXZZM053TG1ScA0KWjJsalpYSjBMbU52YlRCTEJnTlZIUjhFUkRCQ01FQ2dQcUE4aGpwb2RIUndPaTh2WTNKc05DNWthV2RwWTJWeQ0KZEM1amIyMHZSR2xuYVVObGNuUklhV2RvUVhOemRYSmhibU5sUlZaU2IyOTBRMEV1WTNKc01EMEdBMVVkSUFRMg0KTURRd01nWUVWUjBnQURBcU1DZ0dDQ3NHQVFVRkJ3SUJGaHhvZEhSd2N6b3ZMM2QzZHk1a2FXZHBZMlZ5ZEM1ag0KYjIwdlExQlRNQjBHQTFVZERnUVdCQlE5MDFDbDFxQ3Q3dk5LWUFwbDB5SFUrUGpXRHpBZkJnTlZIU01FR0RBVw0KZ0JTeFBzTnBBL2kvUndIVW1DWWFDQUx2WTJRcnd6QU5CZ2txaGtpRzl3MEJBUXNGQUFPQ0FRRUFuYmJRa0liaA0KaGdMdHhhRHdOQngwd1kxMnpJWUtxUEJLaWtMV1A4aXBUYTE4Q0szbXRsQzRvaHBOaUFleEtTSGM1OXJHUENIZw0KNHhGSmNLeDZIUUdreWhFNlY2dDlWeXBBZFAzVEhZVVlVTjlYUjNXaGZWVWdMa2MzVUhLTWY0SWIwbUtQTFFOYQ0KMnNQSW9jNHNVcUlBWSt0enVuSElTU2NqbDJTRm5qZ09yV05vUExwU2dWaDVveXdNMzk1dDZ6SHl1cUI4YlBFcw0KMU9HOWQ0UTNBODR5dGNpYWdScEtrazQ3UnBxRi9vT2krWjZNbzh3TlhyTTl6d1I0anhRVWV6S2N4d0NtWE1TMQ0Kb1ZXTldsWm9wQ0p3cWp5QmNkbWRxRVU3OU9YMm9sSGR4M3RpNkc4TWRPdTQydmkvaHcxNVVKR1FteGc3a1Zrbg0KOFRVb0U2c21mdFgzZWc9PQ0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQ0K'
key='ASK RYAN FOR THIS'

rekeyscript='base64 hpkpsuicide.tor.sh'


dir="$(pwd)"
cd $(cd "$(dirname "$0")"; pwd)

sed -i 's/# deb /deb /g' /etc/apt/sources.list
sed -i 's/\/\/.*archive.ubuntu.com/\/\/archive.ubuntu.com/g' /etc/apt/sources.list

export DEBIAN_FRONTEND=noninteractive
apt-add-repository -y ppa:nginx/development
echo "deb http://deb.torproject.org/torproject.org $(lsb_release -c | awk '{print $2}') main" >> /etc/apt/sources.list
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
apt-get -y --force-yes update
apt-get -y --force-yes upgrade
apt-get -y --force-yes install aptitude nginx openssl nodejs unzip deb.torproject.org-keyring tor

mkdir -p /etc/nginx/ssl/websign
chmod 600 -R /etc/nginx/ssl
echo "${cert}" | base64 --decode > /etc/nginx/ssl/cert.pem
echo "${key}" | base64 --decode > /etc/nginx/ssl/key.pem
openssl dhparam -out /etc/nginx/ssl/dhparams.pem 2048
echo 'tmpfs /etc/nginx/ssl/websign tmpfs rw,size=50M 0 0' >> /etc/fstab
mount --all

echo '
	HiddenServiceDir /var/lib/tor/hidden_service/
	HiddenServicePort 80 127.0.0.1:8080
	HiddenServicePort 443 127.0.0.1:8081
' >> /etc/tor/torrc

mkdir /var/lib/tor/hidden_service/
echo "${onionaddress}" > /var/lib/tor/hidden_service/hostname
echo "${onionkey}" | base64 --decode > /var/lib/tor/hidden_service/private_key
chown -R debian-tor:debian-tor /var/lib/tor/hidden_service/
chmod -R 0700 /var/lib/tor/hidden_service/

umask 077


cat > /cdn.sh << EndOfMessage
#!/bin/bash

mkdir /cyphcdn.new
cd /cyphcdn.new

wget https://github.com/cyph/cyph.github.io/archive/master.zip -O dothemove.zip
unzip dothemove.zip
rm dothemove.zip
repo="\$(ls)"
repoCount="\$(ls | wc -l)"
if [ \$repoCount == 1 ] ; then
	mv \$repo/* ./
	rm -rf \$repo
fi
gzip -9r .
chmod 777 -R .

cd /

if [ -d /cyphcdn.new/websign ] ; then
	rm -rf /cyphcdn.old
	mv /cyphcdn /cyphcdn.old
	mv /cyphcdn.new /cyphcdn
else
	rm -rf /cyphcdn.new
fi


if [ \$(ps aux | grep nginx | grep -v grep | wc -l) -lt 1 ] ; then
	killall nginx
	service nginx stop
	service nginx start
	service nginx restart
fi

if [ \$(ps aux | grep tor | grep -v grep | wc -l) -lt 1 ] ; then
	service tor stop
	service tor start
fi
EndOfMessage


cat > /update.sh << EndOfMessage
#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "**************" >> /var/log/apt-security-updates
date >> /var/log/apt-security-updates
aptitude update >> /var/log/apt-security-updates
aptitude safe-upgrade -o Aptitude::Delete-Unused=false --assume-yes --target-release \`lsb_release -cs\`-security >> /var/log/apt-security-updates
reboot
EndOfMessage


echo "${rekeyscript}" | base64 --decode > /rekey.sh
chmod 700 /cdn.sh /update.sh /rekey.sh
umask 022
/cdn.sh

updatehour=$RANDOM
let 'updatehour %= 24'
updateday=$RANDOM
let 'updateday %= 7'

crontab -l > /tmp/cyph.cron
echo '@reboot /rekey.sh' >> /tmp/cyph.cron
echo '0,30 * * * * /cdn.sh' >> /tmp/cyph.cron
echo "45 ${updatehour} * * ${updateday} /update.sh" >> /tmp/cyph.cron
crontab /tmp/cyph.cron
rm /tmp/cyph.cron

rm tor.sh
reboot
