GENERATED = \
	    hosts \
	    playbooks/vars/master_ip.yml

all: $(GENERATED)

hosts: hosts.in
	( \
		cat hosts.in; \
		./bin/gen-node-ips \
	) > $@

playbooks/vars/master_ip.yml:
	 nova-list-ips | \
		 awk '$$1 == "lars-master" && $$4 ~ /^172.16.10/ {printf "master_ip: %s\n", $$4}' > $@ || rm -f $@

clean:
	rm -f $(GENERATED)

