Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
`https://github.com/rfrohl/shim-review/tree/SUSE-SLES15.3-shim-16.1-20250821`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
x86_64 shim-sles.nx.x86.efi
pesign: 761abe18b1fb57a2c6afdf6d2849eb86da4504718973cd5046a975df581a1c80
sha256sum: df0c956127ea2510c965d17c385bd613c29f545f9c040635ef5ff18e6738ead8

x86_64 shim-sles.x86.efi
pesign: d42f13eb5cb2d2a6166351755f77b2d9311141d94b17f3ca9ffc51412134479c
sha256sum: 8a272d9ff2ee585b72a717a8c13ad1c093120546d60d934fd49ca7ef122149d1

aarch64 shim-sles.nx.aarch64.efi
pesign: 36596346e0981252ba51a0bb66857583464229c00a7105c998edcfdd9296ed99
sha256sum: c42a6d8394bb042585526521bb0b423da041ef77f7173b6304a1fb5429bdfe79

aarch64 shim-sles.aarch64.efi
pesign: a5b2af5ed33cea6d6680cbc19237801574ef05349b6cdc50cf98e1c77112fe4b
sha256sum: dbff0300fcd90a57f40a20decda6e20bf75934910780f3384a1e0063445965e4

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/393

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/419
