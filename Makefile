FQDN ?= example.com
REGGAE_PATH = /usr/local/share/reggae
SERVICES = letsencrypt https://github.com/mekanix/jail-letsencrypt \
	   postgresql https://github.com/mekanix/jail-postgresql \
	   redis https://github.com/mekanix/jail-redis \
	   peertube https://github.com/mekanix/jail-peertube \
	   nginx https://github.com/mekanix/jail-nginx

post_setup:
.for service url in ${SERVICES}
	@echo "FQDN = ${FQDN}" >>services/${service}/project.mk
.endfor
	@echo "/usr/cbsd/jails-data/letsencrypt-data/usr/local/etc/dehydrated/certs /etc/certs nullfs rw 0 0" >services/nginx/templates/fstab
	@echo "/usr/cbsd/jails-data/peertube-data/usr/local/www/peertube /usr/local/www/peertube nullfs rw 0 0" >>services/nginx/templates/fstab

.include <${REGGAE_PATH}/mk/project.mk>

