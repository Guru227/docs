--- Orcale VM VirtualBox ---
# Deleting a guest OS from VM VirtualBox

## Option A: Command Line

1. Move to following directory:

		cd C:\Program Files\Oracle\VirtualBox
		
2. Execute the following command

		VBoxManage.exe unregister --delete "<Name Of VM>"
> Replace with appropriate Name of VM.

## Option B: GUI Interface

You could also delete by right clicking on the VM in GUI interface, selecting the 
'remove' option, and selecting 'deleting all files'. But the cmd command seems to be 
thorough as it removes other files like the logs.

## Option C: Delete files from location

1. Move to following directory:

		cd C:\Users\<user_name>\"VirtualBox VMs"
		
2. Now remove the Folder you would like to delete. The Folder name should be the same as virtual machines you have. Ensure you're retaining any shared virtual storages.


## Source

1. [Removing an OS from VirtualBox (Main)](https://askubuntu.com/questions/316177/how-to-completely-remove-an-os-from-virtualbox)

2. [VMBoxManage.exe file location](https://superuser.com/questions/216692/how-to-run-a-virtualbox-vm-from-command-line)