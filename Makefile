install: 
	cp -n ./pins2-backup.env /etc/pins2-backup || true
	chmod 640 /etc/pins2-backup

	cp ./with-system-snapshot /usr/local/bin/with-system-snapshot
	cp ./pins2-backup /usr/local/bin/pins2-backup

	cp ./pins2-backup-maintenance.service /etc/systemd/system/
	cp ./pins2-backup-maintenance.timer /etc/systemd/system/
	cp ./pins2-backup-system.service /etc/systemd/system/
	cp ./pins2-backup-system.timer /etc/systemd/system/
	cp ./pins2-backup-home.service /etc/systemd/system/
	cp ./pins2-backup-home.timer /etc/systemd/system/
	systemctl daemon-reload
enable:
	systemctl enable --now pins2-backup-maintenance.timer
	systemctl enable --now pins2-backup-system.timer
	systemctl enable --now pins2-backup-home.timer
