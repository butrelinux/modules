# BlueBuild Modules &nbsp; [![build-individual](https://github.com/butrelinux/modules/actions/workflows/build.yml/badge.svg)](https://github.com/butrelinux/modules/actions/workflows/build.yml)

you should mostly be looking upstream for official documentation.  
also check through `/modules`, anything designed for external use will have it's own `README.md`.  they're a bit bare at the moment, but you can manage.  

current list of modules in this repository, with short descriptions:  

`clean-repos`: this cleans up any junk that got missed in the repository cleanup traps at build time.  it's tailored to EL10 and doesn't take inputs, you probably don't want to use it for your repository.  
`custom-kernel`: this does what it says on the tin, but unfortunately does quite a bit more.  I'll probably break this out into smaller modules at some point.  frankly, you should probably just check the code, it's gotten a bit overgrown.  
`fedora-rpm`: takes a repository and a package as an argument.  it's for small self-contained packages and can get pretty dangerous, vet the packages you're installing with it first  
`image-info`: does what it says.  writes `/usr/share/butrelinux/image-info.json` and `/usr/lib/os-release` with butrelinux specific information.  
`nix`: full fat multi-user nix on bootc.  aint that a thing.  avoid determinate flavor, I haven't gotten a chance to test that yet.  built for and tested on centos-bootc:c10s but I think it should work on fedora or other el10 images without issue.  still, I wrote in a build-time warning.  
