# BlueBuild module: custom-kernel
 derived from https://github.com/jokokucing/Origami-Linux/blob/main/modules/custom-kernel/custom-kernel.sh
 Hardened for EL10.
 some features of this module are untested or dangerous.  

 Module options (JSON in $1):
   kernel:     cachyos-lto (default) | ml | hyperscale | stock
                 cachyos-lto  kernel-cachyos-lto from COPR (clang/LTO build)
                 ml           ELRepo kernel-ml (mainline, unsigned for Secure Boot)
                 hyperscale   CentOS Hyperscale SIG kernel
                 stock        keep the base image kernel; only build modules for it (unstable, not recommended)
   initramfs:  true|false     regenerate the initramfs
   nvidia:     true|false     build the NVIDIA driver from the upstream .run
   sign:       {key, cert, mok-password}   SecureBoot signing (untested, not recommended)