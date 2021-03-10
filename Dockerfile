FROM alpine:latest AS builder
RUN apk add --no-cache alpine-sdk libpcap-dev
RUN git clone https://github.com/thefloweringash/tzsp2pcap.git
WORKDIR /tzsp2pcap
ENV LDFLAGS="${LDFLAGS} -static"
RUN make

FROM alpine:latest
COPY --from=builder /tzsp2pcap/tzsp2pcap /usr/bin
WORKDIR /var/tzsp2pcap
EXPOSE 37008/udp
ENTRYPOINT ["tzsp2pcap", "-p", "37008", "-o", "/var/tzsp2pcap/%Y-%m-%d_%H-%M-%S.pcap"]
# Rotate files every 4 hours
CMD ["-G 14400"]