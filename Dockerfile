# syntax = docker/dockerfile:1.0-experimental
FROM opensuse/leap:15.6

ARG ARCHITECTURE
ENV ARCHITECTURE=${ARCHITECTURE}
ADD SUSE_Trust_Root.crt.pem /usr/share/pki/trust/anchors/SUSE_Trust_Root.crt.pem
RUN update-ca-certificates
RUN zypper -n in rpm-build build gnu-efi mozilla-nss-tools openssl pesign dos2unix efitools gcc13 pesign-obs-integration post-build-checks
ADD rpmmacros /root/.rpmmacros 
ADD update-bootloader-rpm-macros-0-1.23.noarch.rpm /
RUN zypper -n in /update-bootloader-rpm-macros-0-1.23.noarch.rpm
COPY shim /usr/src/packages/SOURCES/
# get the current epoch from the build log
RUN source /etc/profile.d/suse-buildsystem.sh && SOURCE_DATE_EPOCH=1754481600 rpmbuild -ba /usr/src/packages/SOURCES/*spec
RUN mkdir /shim
RUN cd /shim/ && unrpm /usr/src/packages/RPMS/$ARCHITECTURE/shim-*.$ARCHITECTURE.rpm
# RUN cd /shim/ && unrpm /usr/src/packages/RPMS/x86_64/shim-*.rpm
# RUN find /shim
RUN pesign --hash --padding --in=/shim/usr/share/efi/$ARCHITECTURE/shim-opensuse.nx.efi
RUN sha256sum /shim/usr/share/efi/$ARCHITECTURE/shim-opensuse.nx.efi
RUN pesign --hash --padding --in=/shim/usr/share/efi/$ARCHITECTURE/shim-opensuse.efi
RUN sha256sum /shim/usr/share/efi/$ARCHITECTURE/shim-opensuse.efi
