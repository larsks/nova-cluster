all: hosts

hosts: hosts.in
	( \
		cat hosts.in; \
		bin/gen-node-ips \
	) > $@
