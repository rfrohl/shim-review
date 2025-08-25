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
sha256sum: 7eb69eca4a3c9524f31977613c13bf2c35014142b4f0b29e157baeec9d2fe5ae

x86_64 shim-opensuse.x86.efi
pesign: a6e3c502d07ac562042c6d4e223b5bfc26bd75bb9489691b5ab5ecb0681d9863
sha256sum: 8303147d8a77df4bd98b4e4f81404bc9d53f85106e9b6c1b4e01ab614f8117e9

aarch64 shim-opensuse.nx.aarch64.efi
pesign: 6f8f8a7c4be5d3af83124aef2c77984a86b026b27e83f2508c6191a4e556f3b4
sha256sum: dc5e7e93f415636fb07a72aeb7af8304a7b9b2848766bcecd03a7b7ad742ccf2

aarch64 shim-opensuse.aarch64.efi
pesign: 60c7080942c8e93f838b6ae7e6cbde71b1632b0d80dc7631e41e3c70234146f7
sha256sum: d607fadfcc5de71a8394957542278a3a46cb306470743b6be2b56b618fb102c9

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/394

*******************************************************************************
### If no security contacts have changed since verification, what is the link to your request, where they've been verified (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/419
