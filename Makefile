install:
	sudo cp overlayroot-sync /usr/local/sbin/
	sudo mkdir -p /usr/local/share/overlayroot-sync
	sudo cp exclude_list /usr/local/share/overlayroot-sync/

uninstall:
	sudo rm /usr/local/sbin/overlayroot-sync
	sudo rm -rf /usr/local/share/overlayroot-sync