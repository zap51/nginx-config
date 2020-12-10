server {
        listen          127.0.0.1:80;
        listen          [::1]:80;
        server_name     "";
        return  308     https://$host$request_uri;
        add_header      Connection "close" always;
}

server {
        listen          127.0.1.1:80;
        listen          [::1]:80;
        server_name     127.0.1.1;
        return 308      https://example.com$request_uri;
        add_header      Connection "close" always;
}
