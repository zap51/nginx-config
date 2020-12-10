# upstream http_u {
#      server                    127.0.0.255:80;
#      keepalive                 16;
# }

server {
        server_name             example.com;
        listen                  127.0.0.1:443 ssl http2;
        listen                  [::1]:443 ssl http2;
        
        root                    /var/www/html;
        
        # HTTP/3
        # listen                  127.0.0.1:443 http3 reuseport;
        # listen                  [::1]:443 http3 reuseport;

        ssl_certificate         /path/to/cert_chain.pem;
        ssl_certificate_key     /path/to/private_key.pem;

        include                 zap/ssl_http.conf;
        include                 zap/headers_hsts_preload.conf;
        include                 zap/error_pages.conf;
        
        # location / {
        #        proxy_pass      http://http_u;
        #        include         proxy_params;
        # }
}
