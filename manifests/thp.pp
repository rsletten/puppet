augeas { "grub-set-thp-never":
  context => "/files/boot/grub/grub.conf",
  changes => [ "setm title[*]/kernel/ transparent_hugepage never"]
} 
