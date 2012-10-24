#!/bin/sh

chmod 755 /tmp/pty

if ! tty > /dev/null 2>&1; then
	echo "$(basename $0): re-executing with pty"
	exec /tmp/pty sudo sh $0
fi

echo "$(basename $0): fixing sudo"
cat > /etc/sudoers.d/notty <<EOF
Defaults !requiretty
EOF

chmod 440 /etc/sudoers.d/notty

yum -y -d1 install puppet pdsh git

