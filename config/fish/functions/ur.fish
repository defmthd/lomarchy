function ur
    sudo reflector --verbose --country 'Russia' -l 10 --sort rate --save /etc/pacman.d/mirrorlist
    sudo pacman -Syyy
    ul
end
