all: hosts

hosts: hosts.in
	( \
		cat hosts.in; \
		./gen-node-ips \
	) > $@
