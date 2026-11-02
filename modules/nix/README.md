# BlueBuild module: nix
 Multi-user (daemon) Nix for CentOS Stream 10 bootc images, for runtime
 package management. Self-contained: all unit files are generated below.

 Options (recipe.yml):
   flavor:                  upstream (default) | determinate
   nix-version:             upstream only; "latest" (default) or a pinned version
   nix-upgrade:             image (default) | never
                            image: on boot, upgrade the live Nix if the image's
                            Nix is newer (never downgrades). never: ship
                            /etc/nix/no-image-upgrade so machines keep their Nix.
   build-users:             number of nixbld users (default 32)
   experimental-features:   list (default [nix-command, flakes])
   extra-conf:              extra nix.conf lines
   selinux:                 add SELinux file contexts (default true)

 Design:
   * Nix is installed into /nix at build time (no systemd needed), then
     moved to /usr/lib/nix-seed/tree, with metadata files beside it.
   * /nix is an empty mountpoint in the image; nix.mount bind-mounts the
     persistent /var/lib/nix onto it.
   * nix-seed.service copies the seed into /var/lib/nix on first boot.
   * nix-upgrade.service (every boot, before the daemon) brings an existing
     /var/lib/nix up to the image's Nix when the image's is newer.
 
 Determinate is untested, use with caution
