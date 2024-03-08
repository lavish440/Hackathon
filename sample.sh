#!/bin/bash

ssh_disable()
{
    systemctl status sshd > /dev/null 2>&1
    STATUS=$?
    if [ $STATUS = 0 ]; then
        printf "SSH is running\n Disabling ssh"
        systemctl disable --now sshd
    else
        printf "SSH is already disabled\n"
    fi
    read -n1 -s -r -p $'\nPress any key to continue...\n'
    clear
    main
}

usb_disable(){
    printf "Disabled all USB ports\n"
    read -n1 -s -r -p $'\nPress any key to continue...\n'
    clear
    main
}

update_system(){
    sudo apt update -y
    sudo apt upgrade -y
}

open_ports(){
    sudo lsof -i -P -n | grep LISTEN
    read -n1 -s -r -p $'\nPress any key to continue...\n'
    clear
    main
}

firewall_rules(){
    sudo iptables -L -v -n | more
    read -n1 -s -r -p $'\nPress any key to continue...\n'
    clear
    main
}

disable_tor(){
    printf "Disabling TOR"
    sudo ln -s /bin/false /usr/bin/toxx

    read -n1 -s -r -p $'\nPress any key to continue...\n'
    clear
    main
}

selinux_install(){

    SEL=$(whiptail --title "Select the option" --menu "Choose the task" 15 60 8 \
            "1" "Disable apparmor" \
            "2" "Mask apparmor UNIT file" \
            "3" "Remove apparmor" \
        3>&1 1>&2 2>&3)


    case "$SEL" in
        1) systemctl disable apparmor ;;
        2) systemctl mask apparmor ;;
        3) sudo apt remove apparmor -y ;;
        *) echo "Invalid option. Quitting" ;;
    esac
    sudo apt install policycoreutils selinux-utils selinux-basics -y
    sudo selinux-activate
    read -n1 -s -r -p $'\nPress any key to continue...\n'
    clear
    main
}

main(){
    OPTION=$(whiptail --title "Ububtu Hardener" --menu "Choose the task" 15 60 8 \
            "1" "Disable ssh" \
            "2" "Disable USB ports" \
            "3" "Upgrade the system" \
            "4" "Show all open ports" \
            "5" "Show firewall rules" \
            "6" "Disable TOR" \
            "7" "Install SELinux" \
        3>&1 1>&2 2>&3)


    case "$OPTION" in
        1) ssh_disable ;;
        2) usb_disable ;;
        3) update_system ;;
        4) open_ports ;;
        5) firewall_rules ;;
        6) disable_tor ;;
        7) selinux_install ;;
        *) echo "Invalid option. Quitting" ;;
    esac
}

main
