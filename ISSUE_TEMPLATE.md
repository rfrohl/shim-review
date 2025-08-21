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
`https://github.com/jsegitz/shim-review/tree/SUSE-SLES15.3-shim-16.0-20250804`
FIXME if you need to move this to your own fork (probably makes sense)

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
x86_64 shim-sles.nx.x86.efi
pesign: 761abe18b1fb57a2c6afdf6d2849eb86da4504718973cd5046a975df581a1c80
sha256sum: 1ca3daab4ebe77adb11215756e3b174b71f6d5eafb65e523ea970e6750949ba5

x86_64 shim-sles.x86.efi
pesign: d42f13eb5cb2d2a6166351755f77b2d9311141d94b17f3ca9ffc51412134479c
sha256sum: 2802c142cb9f90ef04c6258934b9bdd285da07c9d348f34fbe08403f221b6546

aarch64 shim-sles.nx.aarch64.efi
pesign: 36596346e0981252ba51a0bb66857583464229c00a7105c998edcfdd9296ed99
sha256sum: 20445c112a229e6a1f5958fb35be7c82d7fb054b8e6cb80f896ad47128569acc

aarch64 shim-sles.aarch64.efi
pesign: a5b2af5ed33cea6d6680cbc19237801574ef05349b6cdc50cf98e1c77112fe4b
sha256sum: 523fe8b2e21af5e41f82ae7fa58095043c3b06681a569f5dd6195f54b2e9cd5a

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/393

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/419
