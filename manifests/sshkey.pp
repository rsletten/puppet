ssh_authorized_key { 'root':
  user   => "root",
  ensure => present,
  type   => "ssh-rsa",
  key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDLoNDo+HkY+nEQ5jd89NtJxdp6B/fjNMoKuxV+1ovtdrjmGp7CYYe39GwvMqTFi3vxjL+uWJYbIEkPdidbN/IdmSeNyGIILCVSe8PUAgJF2nWofiWsBvflHHWdow3vhIF/k+WBRO39vaq86Qln7I19qtI2QnPzgLgNW0uuUEyIjeKpIvDy33gajGWQoOyTh4ACibsgu8yf+YTgykIq+a0xDf/O6rngQsdbiXZdbm8j8sx81p9q3vVo/2wk2qywiYdx24X5aEedSnQqT6U/cbhLHHq0LM+ZvMvDCfOY4dsraRucj8rg1GxSRn9XezEuv3njd0HK8uoREWP8ch6M2+gN",
  name   => "rsletten@RSletten-W7"
}
