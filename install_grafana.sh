cd /etc/yum.repos.d/
touch grafana.repo
cat << EOF >> grafana.repo
[grafana]
 name=grafana
 baseurl=https://packagecloud.io/grafana/stable/el/7/$basearch
 repo_gpgcheck=1
 enabled=1
 gpgcheck=1
 gpgkey=https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana
 sslverify=1
 sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

yum -y install grafana
systemctl daemon-reload
systemctl start grafana-server
systemctl enable grafana-server
