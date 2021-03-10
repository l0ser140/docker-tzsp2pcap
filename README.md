# docker-tzsp2pcap
Docker image for [tzsp2pcap](https://github.com/thefloweringash/tzsp2pcap) tool.

TZSP to pcap converter for Mikrotik router and other sniffing tools.

# Usage
tzsp2pcap will listen UDP port for TZSP traffic and save in to .pcap file ready for analysis with Wireshark.

    $ docker run -p 37008:37008/udp -v /var/tzsp2pcap:/var/tzsp2pcap

# Parameters
By default new .pcap file will created every 4 hours. You can override it by passing parameters to tzsp2pcap.
### Examples:
Rotate files every 10sec:

    $ docker run -p 37008:37008/udp -v /var/tzsp2pcap:/var/tzsp2pcap -G 10

Rotate files every 100MB:

    $ docker run -p 37008:37008/udp -v /var/tzsp2pcap:/var/tzsp2pcap -C 104857600