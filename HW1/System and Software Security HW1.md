---
tags: SSS
---

# System and Software Security HW1

## 1. Programming

- how to execute:
```
//use make file to compile, and then execute the output file

make 
./p1 

// and then specify the folder, and input the filename
```

###  a. Input your name from the keyboard

### b. please create a file with your input name in the pre-defined path 

First，input the folder name that will include the file，and then input the filename (name):

![image-20231018060715269](/home/hentci/.config/Typora/typora-user-images/image-20231018060715269.png)

- execute before
![image-20231018060728858](/home/hentci/.config/Typora/typora-user-images/image-20231018060728858.png)

- execute after
![image-20231018060746168](/home/hentci/.config/Typora/typora-user-images/image-20231018060746168.png)





## 2. Reverse Engineering

### a. The attack goals (how it works, what damages/ annoyance it can cause)





### b. The window kernel functions it used



### c. Which system files did the malware modify or update?



### d. Suggestion how to prevent the malware



## 3. Window kernel files

### a. Please list 8 most important/common kernel files in Window 10 Pro and their functions

1. **ntoskrnl.exe (NT Kernel File)**
   - Function: The NT Kernel File is the core of the Windows operating system, responsible for managing critical tasks such as system memory, file systems, device drivers, and process management.
2. **hal.dll (Hardware Abstraction Layer File)**
   - Function: The Hardware Abstraction Layer File provides an abstract interface to computer hardware, allowing the operating system to interact with different hardware platforms without modifying the kernel.
3. **win32k.sys (User-Mode Graphics Device Interface File)**
   - Function: This file is part of the Windows user interface and is responsible for handling window, graphics, and user interface rendering operations.
4. **ntdll.dll (NT Layer Dynamic-Link Library)**
   - Function: The NT Layer Dynamic-Link Library provides essential functions and interfaces for communication between user-mode applications and the operating system kernel.
5. **tcpip.sys (TCP/IP Protocol Stack File)**
   - Function: The TCP/IP Protocol Stack File manages network connections and data transmission, supporting Internet connectivity and network communication.
6. **ntkrnlpa.exe (NT Kernel PAE Version)**
   - Function: This is the Physical Address Extension (PAE) version of the NT Kernel, designed to support larger memory address spaces and is used in certain high-end systems.
7. **bootvid.dll (Boot Video Driver File)**
   - Function: The Boot Video Driver File is responsible for initializing and controlling the display device during system boot, ensuring that users can see the startup process.
8. **i8042prt.sys (PS/2 Keyboard and Mouse Driver File)**
   - Function: This file manages PS/2 interface keyboard and mouse input devices, ensuring their proper interaction with the operating system.

### b. Please find the location of your printer driver files and its version. If you have no printer, you can find the location of all Window driver files. 





## 4. Hashing the important files

### Hash your report file + code with MD5 and SHA1 and then create a text file “HashCode.txt” to insert the created hash code