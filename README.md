# PeerTube

### Database Setup

```
make service=postgresql login
su -m postgres -s /bin/tcsh
createuser -P peertube
createdb -O peertube peertube
psql peertube
CREATE EXTENSION pg_trgm;
CREATE EXTENSION unaccent;
```

### Nginx Setup

Checkout peertube example in
[nginx service](https://github.com/mekanix/jail-nginx).
