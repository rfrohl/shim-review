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
pesign: 7eeeaae8a1ff8959fe034ad2139eeee8363cd52d19a2de888478e471be3f8c61
sha256sum: 3ca0605bb086d9873b86bfcbe1e511c9016ba0990b030eeb330e55e7d8f77097  

x86_64 shim-sles.x86.efi
pesign: 71e5b28af465473e42c261936382154cd44fa9049722d49b8b84c30cf05cd781
sha256sum: 9f4a30e3692a40a88b9ee83eeb66daff01bba41b86195b571053987faa6cfdd7

aarch64 shim-sles.nx.aarch64.efi
pesign: 3dbea076748ac09222b951e0d0cec9611804d09ee6676a252a16afdd1506e2bc
sha256sum: 5660e8a501cc40739e02b642211ea54bf26edf97eb1e376bb3fd2bc4bfc405d5

aarch64 shim-sles.aarch64.efi
pesign: 49b1c30211fbe789108ab96f4e6679b43b356f78112683f01b610105bc0cc688
sha256sum: 9d393a38186ead4da0bc17ebcdd4b6ebb859a82b3dfbc093834b4a464021799a

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/393

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/419
