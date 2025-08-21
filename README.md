This repo is for review of requests for signing shim. To create a request for review:

- clone this repo (preferably fork it)
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push it to GitHub
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag
- approval is ready when the "accepted" label is added to your issue

Note that we really only have experience with using GRUB2 or systemd-boot on Linux, so
asking us to endorse anything else for signing is going to require some convincing on
your part.

Hint: check the [docs](./docs/) directory in this repo for guidance on submission and getting your shim signed.

Here's the template:

*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
Organization name and website:  
SUSE, https://www.suse.com/

*******************************************************************************
### What's the legal data that proves the organization's genuineness?
The reviewers should be able to easily verify, that your organization is a legal entity, to prevent abuse.
Provide the information, which can prove the genuineness with certainty.
*******************************************************************************
Company/tax register entries or equivalent:  
(a link to the organization entry in your jurisdiction's register will do)  

I think we're a pretty well known Linux distributor :)

*******************************************************************************
### What product or service is this for?
*******************************************************************************
openSUSE Leap 16 and other openSUSE variants

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
SUSE is one of the major vendors in the Linux ecospace and this shim is a part
of an open source project we sponsor/support

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
They don't boot our grub

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Johannes Segitz
- Position: Security Engineer
- Email address: jsegitz@suse.com
- PGP key fingerprint: EE16 6BCE AD56 E034 BFB3  3ADD 7BF7 29D5 E7C8 1FA0

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: Marcus Meissner
- Position: Project Manager Security
- Email address: meissner@suse.de
- PGP key fingerprint: 7C4A FD61 D8AA E757 0796  A517 2209 D690 2F96 9C95

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Were these binaries created from the 16.1 shim release tar?
Please create your shim binaries starting with the 16.1 shim release tar file: https://github.com/rhboot/shim/releases/download/16.1/shim-16.1.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/16.1 and contains the appropriate gnu-efi source.

Make sure the tarball is correct by verifying your download's checksum
(SHA256, SHA512) with the following ones:

```
46319cd228d8f2c06c744241c0f342412329a7c630436fce7f82cf6936b1d603  shim-16.1.tar.bz2
ca5f80e82f3b80b622028f03ef23105c98ee1b6a25f52a59c823080a3202dd4b9962266489296e99f955eb92e36ce13e0b1d57f688350006bba45f2718f159fb  shim-16.1.tar.bz2
```

Make sure that you've verified that your build process uses that file
as a source of truth (excluding external patches) and its checksum
matches. You can also further validate the release by checking the PGP
signature: there's [a detached
signature](https://github.com/rhboot/shim/releases/download/16.1/shim-16.1.tar.bz2.asc)

The release is signed by the maintainer Peter Jones - his master key
has the fingerprint `B00B48BC731AA8840FED9FB0EED266B70F4FEF10` and the
signing sub-key in the signature here has the fingerprint
`02093E0D19DDE0F7DFFBB53C1FD3F540256A1372`. A copy of his public key
is included here for reference:
[pjones.asc](https://github.com/rhboot/shim-review/blob/main/pjones.asc)

Once you're sure that the tarball you are using is correct and
authentic, please confirm this here with a simple *yes*.

A short guide on verifying public keys and signatures should be available in the [docs](./docs/) directory.
*******************************************************************************
yes

*******************************************************************************
### URL for a repo that contains the exact code which was built to result in your binary:
Hint: If you attach all the patches and modifications that are being used to your application, you can point to the URL of your application here (*`https://github.com/YOUR_ORGANIZATION/shim-review`*).

You can also point to your custom git servers, where the code is hosted.
*******************************************************************************
https://build.opensuse.org/package/show/devel:openSUSE:Factory/shim

This project build just against Factory, which is rather unstable. So it was branched to
https://build.opensuse.org/package/show/home:rfrohl:branches:devel:openSUSE:Factory/shim
to enable the build against 15.6, which is the main target

*******************************************************************************
### What patches are being applied and why:
Mention all the external patches and build process modifications, which are used during your building process, that make your shim binary be the exact one that you posted as part of this application.
*******************************************************************************
Unchanged from last reviewed shim:
- remove_build_id.patch: don't add the build id from the resulting binaries
- shim-arch-independent-names.patch: use the Arch-independent names.
- shim-change-debug-file-path.patch: change path of debug file
- shim-disable-export-vendor-dbx.patch: Prevent issues with ill behaving firmware

*******************************************************************************
### Do you have the NX bit set in your shim? If so, is your entire boot stack NX-compatible and what testing have you done to ensure such compatibility?

See https://techcommunity.microsoft.com/t5/hardware-dev-center/nx-exception-for-shim-community/ba-p/3976522 for more details on the signing of shim without NX bit.
*******************************************************************************
We have an NX enabled shim and a non-NX shim in here and would like to get both signed since ATM our testing looks fine (big QA department + automated testing), but we consider
it still risky. If you don't like this we would like to go with the non-nx shim

*******************************************************************************
### What exact implementation of Secure Boot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
Skip this, if you're not using GRUB2.
*******************************************************************************
Downstream RHEL/Fedora/Debian/Canonical like implementation

*******************************************************************************
### Do you have fixes for all the following GRUB2 CVEs applied?
**Skip this, if you're not using GRUB2, otherwise make sure these are present and confirm with _yes_.**

* 2020 July - BootHole
  * Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html
  * CVE-2020-10713
  * CVE-2020-14308
  * CVE-2020-14309
  * CVE-2020-14310
  * CVE-2020-14311
  * CVE-2020-15705
  * CVE-2020-15706
  * CVE-2020-15707
* March 2021
  * Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
  * CVE-2020-14372
  * CVE-2020-25632
  * CVE-2020-25647
  * CVE-2020-27749
  * CVE-2020-27779
  * CVE-2021-3418 (if you are shipping the shim_lock module)
  * CVE-2021-20225
  * CVE-2021-20233
* June 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-06/msg00035.html, SBAT increase to 2
  * CVE-2021-3695
  * CVE-2021-3696
  * CVE-2021-3697
  * CVE-2022-28733
  * CVE-2022-28734
  * CVE-2022-28735
  * CVE-2022-28736
  * CVE-2022-28737
* November 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-11/msg00059.html, SBAT increase to 3
  * CVE-2022-2601
  * CVE-2022-3775
* October 2023 - NTFS vulnerabilities
  * Details: https://lists.gnu.org/archive/html/grub-devel/2023-10/msg00028.html, SBAT increase to 4
  * CVE-2023-4693
  * CVE-2023-4692
*******************************************************************************
yes

*******************************************************************************
### If shim is loading GRUB2 bootloader, and if these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 4?
Skip this, if you're not using GRUB2, otherwise do you have an entry in your GRUB2 binary similar to:  
`grub,4,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`?
*******************************************************************************
yes

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
If you had no previous signed shim, say so here. Otherwise a simple _yes_ will do.
*******************************************************************************
yes

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
Hint: upstream kernels should have all these applied, but if you ship your own heavily-modified older kernel version, that is being maintained separately from upstream, this may not be the case.  
If you are shipping an older kernel, double-check your sources; maybe you do not have all the patches, but ship a configuration, that does not expose the issue(s).
*******************************************************************************
yes

*******************************************************************************
### How does your signed kernel enforce lockdown when your system runs
### with Secure Boot enabled?
Hint: If it does not, we are not likely to sign your shim.
*******************************************************************************
Our kernel prevents unauthorized modification of the kernel image and access to security-sensitive data.when in lockdown mode.

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
As a major Linux distributor we have many thousands of patches due to the fact that we maintain
kernels for our customers over years. I think this question is next to impossible to answer
for us. Can this please be made more specific? Answering this would results in a wall of text
here.

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
We don't use ephemeral keys. There's no mechanism to ensure that kernel modules are not loaded by another kernel.

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
We don't use this

*******************************************************************************
### If you are re-using the CA certificate from your last shim binary, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs mentioned earlier to vendor_dbx in shim. Please describe your strategy.
This ensures that your new shim+GRUB2 can no longer chainload those older GRUB2 binaries with issues.

If this is your first application or you're using a new CA certificate, please say so here.
*******************************************************************************
We either rely on SBAT, or in cases where this doesn't work we switch to a new signing key, and blacklist the old ones in our vendor dbx.

*******************************************************************************
### Is the Dockerfile in your repository the recipe for reproducing the building of your shim binary?
A reviewer should always be able to run `docker build .` to get the exact binary you attached in your application.

Hint: Prefer using *frozen* packages for your toolchain, since an update to GCC, binutils, gnu-efi may result in building a shim binary with a different checksum.

If your shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case, what the differences would be and what build environment (OS and toolchain) is being used to reproduce this build? In this case please write a detailed guide, how to setup this build environment from scratch.
*******************************************************************************
The included Dockerfile will build the image for you. 
x86_64:
podman build --no-cache --build-arg ARCHITECTURE=x86_64 -t opensuse_shim:16.0 .
aarch64:
podman build --no-cache --build-arg ARCHITECTURE=aarch64  -t opensuse_shim:16.0 .

The Dockerfile builds shim and hashes the resulting file. If you want to do it manually:
The shim sources are in usr/src/packages/SOURCES/. Running
docker run --rm -it opensuse_shim:16.0 /bin/sh
sh-4.4# source /etc/profile.d/suse-buildsystem.sh
sh-4.4# SOURCE_DATE_EPOCH=1754481600 rpmbuild -ba /usr/src/packages/SOURCES/*spec
gives you the build rpm which you can inspect with unrpm, After unpacking you
can get the hashes.

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
build_log.aarch64
build_log.x86_64

These are the build logs from our internal build system. The pesign hash matches,
the sha256sum is different since it tries to attach a signature, which doesn't
match the current shim anymore. The sha256sum specied in this request is the one
that results when build locally (e.g. in the container image)

*******************************************************************************
### What changes were made in the distro's secure boot chain since your SHIM was last signed?
For example, signing new kernel's variants, UKI, systemd-boot, new certs, new CA, etc..

Skip this, if this is your first application for having shim signed.
*******************************************************************************
Last was shim 15.8. We want the new upstream release to fix security issues

*******************************************************************************
### What is the SHA256 hash of your final shim binary?
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
### How do you manage and protect the keys used in your shim?
Describe the security strategy that is used for key protection. This can range from using hardware tokens like HSMs or Smartcards, air-gapped vaults, physical safes to other good practices.
*******************************************************************************
The keys are in a custom build HSM that is in a secure environment. In this
secure environment it's locked away and is accessed rarely and then by multiple
people to ensure seperation of duties.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the shim?
A _yes_ or _no_ will do. There's no penalty for the latter.
*******************************************************************************
no

*******************************************************************************
### Are you embedding a CA certificate in your shim?
A _yes_ or _no_ will do. There's no penalty for the latter. However,
if _yes_: does that certificate include the X509v3 Basic Constraints
to say that it is a CA? See the [docs](./docs/) for more guidance
about this.
*******************************************************************************

yes

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, systemd-boot, systemd-stub, shim + all child shim binaries )?
### Please provide the exact SBAT entries for all binaries you are booting directly through shim.
Hint: The history of SBAT and more information on how it works can be found [here](https://github.com/rhboot/shim/blob/main/SBAT.md). That document is large, so for just some examples check out [SBAT.example.md](https://github.com/rhboot/shim/blob/main/SBAT.example.md)

If you are using a downstream implementation of GRUB2 (e.g. from Fedora or Debian), make sure you have their SBAT entries preserved and that you **append** your own (don't replace theirs) to simplify revocation.

**Remember to post the entries of all the binaries. Apart from your bootloader, you may also be shipping e.g. a firmware updater, which will also have these.**

Hint: run `objcopy --only-section .sbat -O binary YOUR_EFI_BINARY /dev/stdout` to get these entries. Paste them here. Preferably surround each listing with three backticks (\`\`\`), so they render well.
*******************************************************************************
yes

grub2:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,5,Free SoftwareFoundation,grub,2.12,https://www.gnu.org/software/grub/
grub.opensuse,1,The openSUSE Project,grub2,2.12,mailto:security@suse.de
```

fwupd:
```
sbat,1,UEFI shim,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
fwupd-efi,1,Firmware update daemon,fwupd-efi,1.7,https://github.com/fwupd/fwupd-efi
fwupd-efi.opensuse,1,The openSUSE Project,fwupd-efi,1.7,mailto:security@suse.de
```

shim:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.opensuse,1,The openSUSE project,shim,16.0,mail:security@suse.de
```

systemd boot
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
systemd-boot,1,The systemd Developers,systemd,257,https://systemd.io/
systemd-boot.opensuse,1,The openSUSE Project,systemd,257.7-160000.2.5,mailto:security@suse.de
```

*******************************************************************************
### If shim is loading GRUB2 bootloader, which modules are built into your signed GRUB2 image?
Skip this, if you're not using GRUB2.

Hint: this is about those modules that are in the binary itself, not the `.mod` files in your filesystem.
*******************************************************************************
acpi adler32 affs afs afsplitter ahci all_video aout appendedsig
appended_signature_test appleldr archelp asn1 ata at_keyboard backtrace bfs
biosdisk bitmap bitmap_scale blocklist boot_loader_interface boot bsd
bswap_test btrfs bufio cat cbfs cbls cbmemc cbtable cbtime chain
cmdline_cat_test cmdline cmosdump cmostest cmp cmp_test configfile cpio_be cpio
cpuid crc64 cryptodisk crypto crypttab cs5536 ctz_test datehook date datetime
diskfilter disk div div_test dm_nv drivemap echo efiemu efifwsetup efi_gop
efinet efi_uga ehci elf eval exfat exfctest ext2 extcmd f2fs fat file fixvideo
font freedos fshelp functional_test gcry_arcfour gcry_blowfish gcry_camellia
gcry_cast5 gcry_crc gcry_des gcry_dsa gcry_idea gcry_md4 gcry_md5 gcry_rfc2268
gcry_rijndael gcry_rmd160 gcry_rsa gcry_seed gcry_serpent gcry_sha1 gcry_sha256
gcry_sha512 gcry_tiger gcry_twofish gcry_whirlpool gdb geli gettext gfxmenu
gfxterm_background gfxterm_menu gfxterm gmodule gptsync gzio halt hashsum
hdparm hello help hexdump hfs hfspluscomp hfsplus http iorw iso9660 jfs jpeg
json keylayouts keystatus ldm legacycfg legacy_password_test linux16 linuxefi
linux loadbios loadenv loopback lsacpi lsapm lsefimmap lsefi lsefisystab lsmmap
ls lspci lssal lsxen luks2 luks lvm lzopio macbless macho mda_text mdraid09_be
mdraid09 mdraid1x memdisk memrw minicmd minix2_be minix2 minix3_be minix3
minix_be minix mmap morse mpi msdospart mul_test multiboot2 multiboot
nativedisk net newc nilfs2 normal ntfscomp ntfs ntldr odc offsetio ohci
part_acorn part_amiga part_apple part_bsd part_dfly part_dvh part_gpt
part_msdos part_plan part_sun part_sunpc parttool password password_pbkdf2 pata
pbkdf2 pbkdf2_test pcidump pci pgp pkcs1_v15 plan9 play png prep_loadenv
priority_queue probe procfs progress pxechain pxe raid5rec raid6rec random
rdmsr read reboot regexp reiserfs relocator romfs scsi search_fs_file
search_fs_uuid search_label search sendkey serial setjmp setjmp_test setpci sfs
shift_test signature_test sleep sleep_test smbios spkmodem squash4
strtoull_test syslinuxcfg tar terminal terminfo test_asn1 test_blockarg
testload test testspeed tftp tga time tpm2 tpm trig tr truecrypt true udf
ufs1_be ufs1 ufs2 uhci usb_keyboard usb usbms usbserial_common usbserial_ftdi
usbserial_pl2303 usbserial_usbdebug usbtest vbe verifiers vga vga_text
video_bochs video_cirrus video_colors video_fb videoinfo video
videotest_checksum videotest wrmsr xfs xnu xnu_uuid xnu_uuid_test xzio zfscrypt
zfsinfo zfs zstd

*******************************************************************************
### If you are using systemd-boot on arm64 or riscv, is the fix for [unverified Devicetree Blob loading](https://github.com/systemd/systemd/security/advisories/GHSA-6m6p-rjcq-334c) included?
*******************************************************************************
we use systemd systemd-257.7 on tumbleweed (where he have systemd boot), so we have the fix

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB2 or systemd-boot or other)?
*******************************************************************************
grub-2.12 from https://www.gnu.org/software/grub/

*******************************************************************************
### If your shim launches any other components apart from your bootloader, please provide further details on what is launched.
Hint: The most common case here will be a firmware updater like fwupd.
*******************************************************************************
fwupd and systemd-boot can be launched

*******************************************************************************
### If your GRUB2 or systemd-boot launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
Skip this, if you're not using GRUB2 or systemd-boot.
*******************************************************************************
only the kernel

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
Summarize in one or two sentences, how your secure bootchain works on higher level.
*******************************************************************************
n/a

*******************************************************************************
### Does your shim load any loaders that support loading unsigned kernels (e.g. certain GRUB2 configurations)?
*******************************************************************************
It launches grub, fwupd and systemd boot

*******************************************************************************
### What kernel are you using? Which patches and configuration does it include to enforce Secure Boot?
*******************************************************************************
openSUSE tumbleweed is a rolling relaese distro. At the moment we use
6.15 +
# Module signing / secure boot
patches.suse/KEYS-Make-use-of-platform-keyring-for-module-signatu.patch
# Lock down functions for UEFI secure boot
patches.suse/0001-security-lockdown-expose-a-hook-to-lock-the-kernel-down.patch
patches.suse/0002-efi-Add-an-EFI_SECURE_BOOT-flag-to-indicate-secure-boot-mode.patch
patches.suse/0003-efi-Lock-down-the-kernel-if-booted-in-secure-boot-mode.patch
patches.suse/0004-efi-Lock-down-the-kernel-at-the-integrity-level-if-b.patch                                                                      
# Using the hash in MOKx to blacklist kernel module, FATE#316531
patches.suse/0001-MODSIGN-do-not-load-mok-when-secure-boot-disabled.patch
patches.suse/0004-MODSIGN-checking-the-blacklisted-hash-before-loading.patch
# Hibernation Signature Verification FATE#316350
patches.suse/0001-security-create-hidden-area-to-keep-sensitive-data.patch
patches.suse/0002-hibernate-avoid-the-data-in-hidden-area-to-be-snapsh.patch
patches.suse/0005-efi-generate-secret-key-in-EFI-boot-environment.patch
patches.suse/0006-efi-allow-user-to-regenerate-secret-key.patch
patches.suse/0007-PM-hibernate-encrypt-hidden-area.patch
patches.suse/0008-PM-hibernate-Generate-and-verify-signature-for-snaps.patch
patches.suse/0009-PM-hibernate-prevent-EFI-secret-key-to-be-regenerate.patch
patches.suse/0010-PM-hibernate-a-option-to-request-that-snapshot-image.patch
patches.suse/0011-PM-hibernate-require-hibernate-snapshot-image-to-be-.patch

*******************************************************************************
### What contributions have you made to help us review the applications of other applicants?
The reviewing process is meant to be a peer-review effort and the best way to have your application reviewed faster is to help with reviewing others. We are in most cases volunteers working on this venue in our free time, rather than being employed and paid to review the applications during our business hours. 

A reasonable timeframe of waiting for a review can reach 2-3 months. Helping us is the best way to shorten this period. The more help we get, the faster and the smoother things will go.

For newcomers, the applications labeled as [*easy to review*](https://github.com/rhboot/shim-review/issues?q=is%3Aopen+is%3Aissue+label%3A%22easy+to+review%22) are recommended to start the contribution process.
*******************************************************************************
Nikolay Borisov of SUSE helps out with the reviews

*******************************************************************************
### Add any additional information you think we may need to validate this shim signing application.
*******************************************************************************
This is very compareable to our previous submission.

There were concerns about the use of an additional parameter for the podman call
(--build-arg ARCHITECTURE=). This is needed since x86 and aarch64 need slightly
different commands to build shim
