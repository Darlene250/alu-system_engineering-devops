# This Puppet manifest fixes Nginx to handle high traffic
exec { 'fix--for-nginx':
  command => 'sed -i "s/worker_connections 768/worker_connections 4096/" /etc/nginx/nginx.conf && \
(grep -q "worker_rlimit_nofile" /etc/nginx/nginx.conf || \
sed -i "/worker_processes/a worker_rlimit_nofile 8192;" /etc/nginx/nginx.conf) && \
service nginx stop && sleep 1 && service nginx start',
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
