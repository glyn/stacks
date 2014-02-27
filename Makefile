all: rhel7.tar.gz

rhel7.cid: rhel7/Dockerfile
	docker build -t rhel7-beta rhel7

	# create a container to export
	docker run -cidfile=rhel7.cid rhel7-beta ls

rhel7.tar: rhel7.cid
	docker export `cat rhel7.cid` > rhel7.tar
	rm rhel7.cid

rhel7.tar.gz: rhel7.tar
	tar -C rhel7/assets -f rhel7.tar -r etc/hosts etc/timezone
	gzip -f rhel7.tar
