# Windows Subsystem for Linux

## Overview

### What is WSL?

The Windows Subsystem for Linux lets developers run a GNU/Linux environment - including most command-line tools, utilities, and applications - directly on Windows, unmodified, without the overhead of a traditional virtual machine or a dual-boot setup.

What you can do?

- Choose linux distribution from the *Microsoft Store*.
- Run command-line tools such as grep, sed, awk or other ELF-64 binaries.
- Run Bash shell scripts and GNU/Linux command-line applications including
	+ **Tools:** emacs, vim, tmux
	+ **Languages:** Python, C/C++, etc.
	+ **Services:** SSHD, MySQL, Apache, lighttpd, MongoDB, PostgreSQL
- Install additional software using own GNU/Linux distribution package manager
- Invoke Windows applications using a Unix-line command-line shell
- Invoke GNU/Linux applications on Windows

### What is WSL 2?

WSL 2 is a new version of the Windows Subsystem for Linux Architecture that powers the Windows Subsystem for Linux to run ELF-64 binaries on Windows. Its primary goals are to increase file system performance, as well as adding full system call compatibility.

This new architecture changes how these Linux binaries interact with Windows and your computer's hardware, but still provides the same user experience as in WSL 1.

Individual Linux distributions can be run with either WSL 1 or WSL 2 architecture. Each distribution can be upgraded or downgraded at any time and you can run WSL 1 and WSL 2 distributions side by side. WSL 2 is a major overhaul of the underlying architecture and uses virtualisation technology and a Linux Kernel to enable its new features.

WSL 2 is only available in Windows 10, Version 2004, Build 19041 or higher. You may need to update your Windows version.

## Comparing WSL 1 and WSL 2 features

| Feature | WSL 1 | WSL 2 |
| --- | --- | --- |
| Integration between Windows and Linux 	| yes | yes |
| Fast boot times 							| yes | yes |
| Small resource footprint					| yes | yes |
| Managed VM								| no  | yes |
| Full Linux Kernel							| no  | yes |
| Full system call compatibility			| no  | yes |
| Runs with current versions of VMWare and Virtual box | yes | no  |
| Performance across OS file systems		| yes | no  |
 
#### Use the Linux File System for faster performance

In order to optimize for the fastest performance speed, be sure to store your project files in Linux File System (not the windows file system).

For example, when storing your WSL project files:

- Use the Linux file system root directory: `\\wsl$\Ubuntu-18.04\home\<user name>\Project` and not the Windows file system directory `C:\Users\<user name>\Project`

Project files that you are working with using a WSL distribution must be in the Linux root file system to take advantage of faster file system access.

You can access your Linux root file system with Windows apps and tool like File Explorer. Try opening a Linux distribution, and move to your home directory. Then open your Linux file system in File explorer by entering `explorer.exe .`

### Exceptions for using WSL 1 over WSL 2

It's recommended to use WSL 2 as it offers faster performance and 100% system call compatibility. However, there are a few specific scenarios where you might prefer using WSL 1.

- Your project files must be stored in the Windows File System.
> If you will be using tour WSL Linux distribution to access project files on the Windows file system, and these files cannot be stored on the Linux file system, you will achieve faster performance across the OS file systems by using WSL 1.

- A project which requires cross-compilation using both Windows and Linux tools on the same files.
> File performance across the Windows and Linux operations systems is faster in WSL 1 than WSL 2, so if you are using Windows applications to access Linux files, you will currently achieve faster performance with WSL 1.

**Note: ** You could also consider using VS Code ***Remote WSL extension*** to enable you to store your project files on Linux file system, using Linux command line tools, but also using VS Code on Windows to author, edit, debug or run your project in an internet browser without any of the performance slow-downs associated with working across Linux and Windows file systems.

## WSL 2 architecture

A traditional VM experience can be slow to boot up, is isolated, consumes lots of resources, and requires your time to manage it. WSL 2 does not have these attributes.

WSL 2 provides the benefits of WSL 2, including seamless integration between Windows and Linux, fast boot times, a small resource footprint, and requires no VM configuration or management. While WSL 2 does use a VM, it is manages and run behind the scenes, leaving you with the same user experience as WSL 1.

### Full Linux Kernel

The Linux Kernel in WSL 2 is built by Microsoft from the latest stable branch, based on the source available at kernel.org. This kernel has been specially tuned for WSL 2, optimizing for size and performance to provide an amazing Linux experience on Windows. The kernel will be serviced by Windows updates which means you will get the latest security fixes and kernel improvements without needing to manage it yourself.

### Increased file IO performance

File intensive operations like `git clone, npm install, apt update, apt upgrade`, and more are all noticeably faster with WSL 2.

### Full system call compatibility

Linux binaries use system calls to perform functions such as accessing files, requesting memory, creating processes, and more. Whereas WSL 1 used a translation layer that was built by the WSL team, WSL 2 includes its own Linux kernel with full system call compatibility. Benefits include:

- A whole new set of apps that you can run inside of WSL, such as Docker and more.
- Any updates to the Linux kernel are immediately ready for use. (You don't have to wait for the WSL team to implement update and add the changes)

### WSL 2 uses a smaller amount of memory on start-up

WSL 2 uses a lightweight utility VM on a real Linux kernel with a small memory footprint. The utility will allocate Virtual Addresses backed memory on startup. It is configured to start with a smaller proportion of your total memory than what was required for WSL 1.


## WSL Installation Guide for Windows 10

### Install WSL

Before installing any Linux distributions on Windows, you must enable the "Windows Subsystem for Linux" optional feature.

Open PowerShell as Administrator and run:

	dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
	
To only install WSL 1, you should now restart your machine and move on to Install your Linux distribution of your choice, otherwise wait to restart and move on to WSL 1.

### Update to WSL 2

Ensure your machine is running Windows 10, updated to version 2004 and has build of 19041 or later.

#### Enable the 'Virtual Machine Platform' optional component

Before installing WSL 2, you must enable the "Virtual Machine Platform" optional feature.

Open PowerShell as Administrator and run:

	dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
	
Restart your machine to complete the WSL install and update to WSL 2.

#### Set WSL 2 as your default version

Run the following command in PowerShell to set WSL 2 as the default version when installing a new Linux distribution.

	wsl --set-default-version 2

You might see this message after running that command:
> WSL 2 requires an update to its kernel component. For information please visit `https://aka.ms/wsl2kernel`

Please follow the link and install the MSI form that page on our documentation to install a Linux kernel on your machine for WSL 2 to use. Once you have the kernel installed, please run the command again and it should complete successfully without showing the message.

**Note: **The update from WSL 1 to WSL 2 may take several minutes to compete depending on the size of your targeted distribution. If you are running an older (legacy) installation of WSL 1 from Windows 10, you may encounter an update error. To uninstall and remove any legacy distributions, [click here].

### Install your Linux distribution of choice from Windows Store

### Set up a new distribution

The first time you launch a newly installed Linux distribution, a console window will open and you'll be asked to wait for a minute or two for files to de-compress and be stored on your PC. All future launches should take less than a second.

You will then need to create a user account and password for your new Linux distribution.

### Set your distribution to WSL 1 or WSL 2

Check WSL version for distribution using:

	wsl --list --verbose

To set WSL version for ditribution:

	wsl --set-version <distribution-name> <versionNumber>
	// <distribution-name> = name of distribution
	// <versionNumber> = 1 or 2

## Create an user account and password for your new Linux distribution

After WSL set-up and Linux distribution installation, the first step you will be asked to complete when opening your newly installed Linux distribution is to create an account, including a `User Name` and a `Password`.

- This user name and password is specific to your Linux distribution and has no bearing on your Windows user name.
- Once you create this user name and password, the account will be your default user for the distribution and automatically sign-in on launch.
- This account will be considered the Linux administrator, with the ability to run `sudo` administrative commands.
- Each Linux distribution running on the WSL has its own Linux user accounts and passwords. You will have to configure a Linux user account every time you add a distribution, reinstall, or reset.

### Update and upgrade packages

Most distribution ship with an empty or minimal package catalogue. We strongly recommend regularly updating your package catalogue and upgrading your installed packages using your distribution's preferred package manager. For Debian/Ubuntu, use apt:

	sudo apt update && sudo apt upgrade
	
Windows does not automatically update or upgrade your Linux distributions.

### Reset your Linux password

To change your password, open you Linux distribution (Ubuntu for example) and enter the command:

	passwd

You will be asked to enter your current password, then asked to enter your new password, and ten to confirm your new password.

### Forgot your password

If you forgot the password for your Linux distribution:

1. Open PowerShell and enter the root of your default WSL distribution using the command 
		
		wsl -u root

	> If you need to update the forgotten password on a distribution that is not your default, use the command:
		
		wsl -d <distribution-name> -u root
		
1. Once your WSL distribution has been opened at the root level inside PowerShell, you can use this command to update your password
	
		passwd
		
1. You will be prompted to enter a new UNIX password and the confirm that password. Once you're told that the password has updated successfully, close WSL inside of PowerShell using the command `exit`.


## Source

1. [Overview](https://docs.microsoft.com/en-us/windows/wsl/about)
2. [Comparing Features & WSL 2 architecture](https://docs.microsoft.com/en-us/windows/wsl/compare-versions)
3. [Installation WSL 1 and Update to WSL 2](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting)
4. [Troubleshooting Installation](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting)
5. [Create a user account & password](https://docs.microsoft.com/en-us/windows/wsl/user-support)

## To be Further Explored

1. ELF-64 binaries
2. [VS Code - Remote WSL Extension](https://code.visualstudio.com/docs/remote/wsl)