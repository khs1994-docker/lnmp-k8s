# PHP 日志

```bash
error_log= /var/log/php-fpm/php.error.log
```

## PHP-FPM

```bash
[global]

error_log = /var/log/php-fpm/error.log

[www]

access.log = /var/log/php-fpm/access.log

request_slowlog_timeout = 5

slowlog = /var/log/php-fpm/slow.log
```
