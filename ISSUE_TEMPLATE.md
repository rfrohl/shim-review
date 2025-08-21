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
`https://github.com/rfrohl/shim-review/tree/SUSE-Leap16.0-shim-16.1-20250819`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
x86_64 shim-opensuse.nx.x86.efi
pesign: 07797e52548d05cef15d100980e48acb4109f103375b4088ffcfe759beb107d1
sha256sum: feae1ba32467a39c328a6b4496cc25ca15b30c97be137e2fc6d972fa66c143da

x86_64 shim-opensuse.x86.efi
pesign: a6e3c502d07ac562042c6d4e223b5bfc26bd75bb9489691b5ab5ecb0681d9863
sha256sum: 9256f0e21e49d90e0787112691a229a69607521329eca79763e08e8bbc0ea7ef

aarch64 shim-opensuse.nx.aarch64.efi
pesign: 6f8f8a7c4be5d3af83124aef2c77984a86b026b27e83f2508c6191a4e556f3b4
sha256sum: cf1854fa4c3786369b50954949440a16b0c68f54be87124b5b29cab2a20804d7

aarch64 shim-opensuse.aarch64.efi
pesign: 60c7080942c8e93f838b6ae7e6cbde71b1632b0d80dc7631e41e3c70234146f7
sha256sum: a77d211e65be9cc16bca5b38706d98834e68f4894e53b69d6c40b1c2fe791d93

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/394

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/419
