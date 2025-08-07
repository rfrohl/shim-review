Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information
 - [ ] shim.efi to be signed FIXME add them
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [ ] a Dockerfile to reproduce the build of the provided shim EFI binaries FIXME

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
`https://github.com/jsegitz/shim-review/tree/SUSE-openSUSE_tumbleweed-shim-15.8-20240301`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
x86_64 shim-opensuse.nx.x86.efi
pesign: FIXME
sha256sum: FIXME

x86_64 shim-opensuse.x86.efi
pesign: FIXME
sha256sum: FIXME

aarch64 shim-opensuse.nx.aarch64.efi
pesign: FIXME
sha256sum: FIXME

aarch64 shim-opensuse.aarch64.efi
pesign: FIXME
sha256sum: FIXME

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/394
