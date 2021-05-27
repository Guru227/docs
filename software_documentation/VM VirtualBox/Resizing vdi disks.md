--- Orcale VM VirtualBox ---

# Resizing vdi disks

**NOTE:** You can only resize `dynamically formatted disks`, and cannot resize `statically formatted disks`. You cannot change formats of vdi's, but you can create a clone with a dynamic format.
**NOTE:** backup before any operation, especially if you have valuable data. (Either copy-paste the folder from `C:\users\<user-name>\VirtualBox VMs` or create a clone)

1. Create a clone, using the GUI menu. If a clone with all snapshots don't work (haven't tried) then create a clone of only current state.

1. Open `Visual Media Manager` under `File`. Under the `information` tab of the specifc vdi, ensure it is of `dynamic format`. Then, use the slider under the `attributes` tab to resize it. This will also be reflected as the Virtual Size.

1. Download `GParted` from https://gparted.org/download.php (i686 for 32 bit, amd 64 for 64bit)

1. Create a new VM instance of a linux 2.x/3.x/4.x OS, and the GParted iso image under IDE controllers. Next add the vdi you wish to resize under SATA controllers. Fire up the instance.

1. In GParted, successively expand the outer partition containers to include the unallocated space until the innermost partition has been extended.

1. Shutdown GParted, and fire up the vdi in its intended guest OS, and ensure it works. That's it, you're done!

## Sources

1. [Resizing a virtual box](http://derekmolloy.ie/resize-a-virtualbox-disk/)

1. [The fact that fixed format is not supported](https://forums.virtualbox.org/viewtopic.php?f=6&t=45989)

1. [CLI commands (if you want)](https://superuser.com/questions/716649/how-to-change-fixed-size-vdi-with-modifyhd-command-in-windows)

1. [The idea that everything can now be done through GUI, and cmd is obsolete](https://forums.virtualbox.org/viewtopic.php?f=1&t=33528)
