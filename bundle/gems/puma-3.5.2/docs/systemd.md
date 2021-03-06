# systemd

[systemd](https://www.freedesktop.org/wiki/Software/systemd/) is a
commonly available init system (PID 1) on many Linux distributions. It
offers process monitoring (including automatic restarts) and other
useful features for running Puma in production. Below is a sample
puma.service configuration file for systemd:

~~~~
[Unit]
Description=Puma HTTP Server
After=network.target

# Uncomment for socket activation (see below)
# Requires=puma.socket

[Service]
# Foreground process (do not use --daemon in ExecStart or config.rb)
Type=simple

# Preferably configure a non-privileged user
# User=

# Specify the path to your puma application root
# WorkingDirectory=

# Helpful for debugging socket activation, etc.
# Environment=PUMA_DEBUG=1

# The command to start Puma
# Here we are using a binstub generated via:
# `bundle binstubs puma --path ./sbin`
# in the WorkingDirectory (replace <WD> below)
# You can alternatively use `bundle exec --keep-file-descriptors puma`
# ExecStart=<WD>/sbin/puma -b tcp://0.0.0.0:9292 -b ssl://0.0.0.0:9293?key=key.pem&cert=cert.pem

# Alternatively with a config file (in WorkingDirectory) and
# comparable `bind` directives
# ExecStart=<WD>/sbin/puma -C config.rb

Restart=always

[Install]
WantedBy=multi-user.target
~~~~

See [systemd.exec](https://www.freedesktop.org/software/systemd/man/systemd.exec.html)
for additional details.

## Socket Activation

systemd and puma also support socket activation, where systemd opens
the listening socket(s) in advance and provides them to the puma master
process on startup. Among other advantages, this keeps listening
sockets open across puma restarts and achieves graceful restarts. To
use socket activation, configure one or more `ListenStream`
sockets in a companion `*.socket` systemd config file. Here is a sample
puma.socket, matching the ports used in the above puma.service:

~~~~
[Unit]
Description=Puma HTTP Server Accept Sockets

[Socket]
ListenStream=0.0.0.0:9292
ListenStream=0.0.0.0:9293

# AF_UNIX domain socket
# SocketUser, SocketGroup, etc. may be needed for Unix domain sockets
# ListenStream=/run/puma.sock

# Socket options matching Puma defaults
NoDelay=true
ReusePort=true
Backlog=1024

[Install]
WantedBy=sockets.target
~~~~

See [systemd.socket](https://www.freedesktop.org/software/systemd/man/systemd.socket.html)
for additional configuration details.

Note that the above configurations will work with Puma in either
single process or cluster mode.

## Usage

Without socket activation, use `systemctl` as root (e.g. via `sudo`) as
with other system services:

~~~~ sh
# After installing or making changes to puma.service
systemctl daemon-reload

# Enable so it starts on boot
systemctl enable puma.service

# Initial start up.
systemctl start puma.service

# Check status
systemctl status puma.service

# A normal restart. Warning: listeners sockets will be closed
# while a new puma process initializes.
systemctl restart puma.service
~~~~

With socket activation, several but not all of these commands should
be run for both socket and service:

~~~~ sh
# After installing or making changes to either puma.socket or
# puma.service.
systemctl daemon-reload

# Enable both socket and service so they start on boot.  Alternatively
# you could leave puma.service disabled and systemd will start it on
# first use (with startup lag on first request)
systemctl enable puma.socket puma.service

# Initial start up. The Requires directive (see above) ensures the
# socket is started before the service.
systemctl start puma.socket puma.service

# Check status of both socket and service.
systemctl status puma.socket puma.service

# A "hot" restart, with systemd keeping puma.socket listening and
# providing to the new puma (master) instance.
systemctl restart puma.service

# A normal restart, needed to handle changes to
# puma.socket, such as changing the ListenStream ports. Note
# daemon-reload (above) should be run first.
systemctl restart puma.socket puma.service
~~~~

Here is sample output from `systemctl status` with both service and
socket running:

~~~~
??? puma.socket - Puma HTTP Server Accept Sockets
   Loaded: loaded (/etc/systemd/system/puma.socket; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2016-04-07 08:40:19 PDT; 1h 2min ago
   Listen: 0.0.0.0:9233 (Stream)
           0.0.0.0:9234 (Stream)

Apr 07 08:40:19 hx systemd[874]: Listening on Puma HTTP Server Accept Sockets.

??? puma.service - Puma HTTP Server
   Loaded: loaded (/etc/systemd/system/puma.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2016-04-07 08:40:19 PDT; 1h 2min ago
 Main PID: 28320 (ruby)
   CGroup: /system.slice/puma.service
           ??????28320 puma 3.3.0 (tcp://0.0.0.0:9233,ssl://0.0.0.0:9234?key=key.pem&cert=cert.pem) [app]
           ??????28323 puma: cluster worker 0: 28320 [app]
           ??????28327 puma: cluster worker 1: 28320 [app]

Apr 07 08:40:19 hx puma[28320]: Puma starting in cluster mode...
Apr 07 08:40:19 hx puma[28320]: * Version 3.3.0 (ruby 2.2.4-p230), codename: Jovial Platypus
Apr 07 08:40:19 hx puma[28320]: * Min threads: 0, max threads: 16
Apr 07 08:40:19 hx puma[28320]: * Environment: production
Apr 07 08:40:19 hx puma[28320]: * Process workers: 2
Apr 07 08:40:19 hx puma[28320]: * Phased restart available
Apr 07 08:40:19 hx puma[28320]: * Activated tcp://0.0.0.0:9233
Apr 07 08:40:19 hx puma[28320]: * Activated ssl://0.0.0.0:9234?key=key.pem&cert=cert.pem
Apr 07 08:40:19 hx puma[28320]: Use Ctrl-C to stop
~~~~
