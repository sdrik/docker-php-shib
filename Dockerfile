FROM sdrik/php
RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list \
	&& for pkg in \
		init-system-helpers \
		liblog4shib2 \
		libxerces-c3.2 \
		libxml-security-c20 \
		libxmltooling8 \
		libsaml10 \
		opensaml-schemas \
		xmltooling-schemas \
		libshibsp8 \
		libshibsp-plugins \
		shibboleth-sp-common \
		shibboleth-sp-utils \
		libapache2-mod-shib \
	; do echo "Package: ${pkg}\nPin: release n=stretch-backports\nPin-Priority: 990\n\n" \
	; done > /etc/apt/preferences.d/shibboleth-backports \
	&& apt-get update && apt-get upgrade -y && apt-get install -y \
		libapache2-mod-shib \
	&& rm -rf /var/lib/apt/lists/*

CMD ["apache2-foreground"]
ONBUILD CMD ["apache2-foreground"]
