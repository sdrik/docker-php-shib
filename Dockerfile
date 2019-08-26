FROM sdrik/php
RUN  \
	apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
		libapache2-mod-shib \
	&& rm -rf /var/lib/apt/lists/*

CMD ["apache2-foreground"]
ONBUILD CMD ["apache2-foreground"]
