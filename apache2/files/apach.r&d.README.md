1588  nano /etc/systemd/system.conf
1589  sudo systemctl daemon-reload
1590  ulimit -n
1591  systemctl -p
1592  systemd -p
1593  systemctl show apache2 -p LimitNOFILE
1594  nano /etc/apache2/mods-available/mpm_prefork.conf
1595  sudo systemctl restart apache2
1596  systemctl daemon-reexec
1597  ulimit -n
1598  ulimit -n 75000
1599  ulimit -n
1600  nano /opt/
1601  nano /opt/kservice.sh
1602  chmod +x /opt/kservice.sh
1603  /opt/kservice.sh
1604  systemctl status varnish
1605  systemctl status nginx
1606  netstat -tulpn
1607  nano /etc/varnish/default.vcl
1608  /opt/kservice.sh
1609  sysytemctl stop apache2
1610  systemctl stop apache2.service
1611  /opt/kservice.sh
1612  crontab -e
1613  tail -f /var/log/kservice.log
1614  sudo nano /etc/logrotate.d/service_check
1615  sudo nano /etc/logrotate.d/kservice
1616  ls -la /var/log/kservice.log
1617  sudo logrotate -d /etc/logrotate.d/service_check
1618  ls -la /var/log/kservice.log
1619  sudo logrotate -d /etc/logrotate.d/kservice
1620  sudo nano /etc/logrotate.d/kservice
1621  sudo logrotate -d /etc/logrotate.d/kservice
1622  ls -la /var/log/kservice.log
1623  ls -la /var/log/
1624  sudo nano /etc/logrotate.d/kservice
1625  ls -la /var/log/kservice.log
1626  sudo logrotate -d /etc/logrotate.d/kservice
1627  ls -la /var/log/kservice.log
1628  sysytemctl status apache2
1629  netstat -tulsh
1630  netstat -tulpn
1631  ping 10.12.2.196
1632  nc 10.12.2.196 -v
1633  nc 10.12.2.196 3306 -v
1634  service apache2 status
1635  service varnish status
1636  journalctl -f
1637  cat -n 600 /var/log/kservice.log
1638  cat /var/log/kservice.log | grep "down"
1639  systemctl status apache2.service
1640  systemctl restart apache2.service
1641  history
1642  cat /var/log/kservice.log | grep "down"
1643  cat -n 600 /var/log/kservice.log
1644  history