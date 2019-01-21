run_initial_commands() {
    make
    sudo insmod main.ko    
}

get_major_number() {
    local major_number = tail -n 1  /var/log/kern.log | grep -o '.\{3\}$'
    echo major_number
}

make_nod() {
    major_number = $(get_major_number)
    cd /dev
    sudo mknod walter c major_number 0
}

run_initial_commands()
make_nod()
cat /dev/walter