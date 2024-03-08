# Problem Statement

_Problem: 56_

**Developing a GUI based hardening script for Ubuntu operating system with flexibility to cater for organisational security policies**

## Ideas

- We have developed a Bash script based on a NCURSES like library.
- We implemented NCURSES beacause servers generally don't have a GUI.
- User can easily select the security options that he wants to add to his system.
- The options can easily be added and vice-versa.
- Frontend using C++ QT, Python PyQT5 or tkinter can be added.
- A frontend website can also be implemented.
- We will divide hardening options into modules (user management, network security, logging).Each module allows users to choose specific hardening actions based on policy.
- We will provide clear explanations for each hardening option, including its impact to common security threats.
- We will offer pre-configured hardening options based on common security needs (high-security workstation, low-interaction server).
- We have allowed the script to run with elevated privileges (sudo) only when necessary, minimizing the attack surface.
- We will integrate checks to verify system compatibility and identify potential conflicts before applying hardening actions.
- We will create a detailed log of all hardening actions taken, including timestamps and user information, for auditing purposes. 

## Members

1. _Lavish_
1. _Mayank Pandey_
1. _Parv Aggarwal_
