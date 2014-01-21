augeas { "grub-set-thp-never":
  context => "/files/boot/grub/grub.conf",
  changes => [ "setm /files/boot/grub/grub.conf/title/kernel/  transparent_hugepages=never"]
} 
