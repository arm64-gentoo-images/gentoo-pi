do-pentoo () { 
mkdir /mnt/{$gentoo-rpi}/etc/portage/repos.conf/
cat <<EOL >> 
[pentoo]
location = /var/db/repos/pentoo
sync-type = git
sync-uri = https://github.com/gentoo-mirror/pentoo.git
EOL
}
