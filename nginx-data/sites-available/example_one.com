server {
        listen   80; ## listen for ipv4; this line is default and implied
        #listen   [::]:80 default ipv6only=on; ## listen for ipv6

        root /var/www/example_one.com/public_html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name example_one.local;
}

server {
        listen      443           ssl http2;
        listen [::]:443           ssl http2;
        server_name               example_one.local;

        add_header                Strict-Transport-Security "max-age=31536000" always;

        ssl_session_cache         shared:SSL:20m;
        ssl_session_timeout       10m;

        ssl_protocols             TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_ciphers               "ECDH+AESGCM:ECDH+AES256:ECDH+AES128:!ADH:!AECDH:!MD5;";

        root /var/www/example_one.local/public_html;
        index index.html

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ssl_certificate           /etc/certs/example_one.local.crt;
        ssl_certificate_key       /etc/certs/example_one.local.key;

}
