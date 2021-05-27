--- Orcale VM VirtualBox ---
# Creating a shared folder on VirtualVox

1. Run insatnce of Guest OS.
1. Click on Devices in the taskbar and select 'Insert Guest additions CD image.
1. Click on the disk image and run it.
1. Next, click on Machine in Options Menu and then click on Settings option.
1. On the left menu pane, click on Shared folders.
1. Click on the 'add new folder' icon on the right margin.
1. Specify folder path (on host OS), folder name (for guest operating system), and click on the checkboxes against automount and make permanent.
1. Then click on OK.
1. Then open Terminal and run the command 'sudo usermod -aG vboxsf userName'
	This command gives makes user 'userName' part of the group vboxsf.
1. Finally, restart to have the group added.

## Source
1. [Creating a shared foler (main)](https://www.howtogeek.com/189974/how-to-share-your-computers-files-with-a-virtual-machine/)
2. [Access a shared folder (main)](https://askubuntu.com/questions/161759/how-to-access-a-shared-folder-in-virtualbox)