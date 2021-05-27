# Delete Ubuntu from Windows 10 dual boot

## Delete Ubuntu Partition (data)

1. Back up files from ubuntu partitition.
1. Sign into windows. Open disk management and deallocate Ubuntu partition’s space.
1. With this, ubuntu has been successfully removed.

## Reorder Boot Order

Boot into UEFI Firmware interface. For me, I can enter the firmware interface by pressing on `F2` while booting. You need to check with your manufacturer's website to find out how to enter this interface. It's usally one of `F1, F2, F8, F9`.<br>
Reorder Windows boot as higher priority than grub.

## Removing GRUB

### Option A: Using windows recovery drive

1. Boot using the recovery drive.
1. Choose Troubleshoot --> Choose Command Prompt. Run the following commands
>```
	run bootrec.exe /fixmbr
	restart
	```

1. If that doesn't work, try using automatic repair
> Automatic repair is the option with the `settings-icon`
	
### Option B: Manually fixing EFI partition (Preferrable)

1. Run cmd.exe using administrator priviliges.
1. Run `diskpart` and list all disks (hard-disk)
	
		diskpart	
		list disk
1. Assign a partition letter to the UEFI volume (partition). 
> Select the disk where UEFI is installed. <br>
> Select the UEFI volume. <br>
> Here, I assign the volume the partition letter of `Z:`. <br> 
> Then, exit `diskpart`.
	
		sel disk <num>
		list vol
		sel vol <num>
		assign letter=<letter>
			-- sel disk 0
			-- sel vol 5
			-- assign letter=Z (ensure that letter is unused by other partitions)
		exit
		
1. Now access the contents of the Ubuntu partition and remove the following
>	- GRUB
>	- initramfs files (kernel images)			
		
		Z:							// switches to Z:
		dir							// list directories
		cd EFI
		rmdir /S ubuntu				// Delete ubuntu grub
		
		del /f <initramfs files> 	// deletes the initramfs files, located probably in EFI

1. Finally, remove the asigned letter to the UEFI partition
	
		diskpart
		list disk
		
		sel disk <num> (same num as last time)
		sel vol <num> (same num as last time)
		remove letter=<letter> (same letter as last time)
			
		//For me, I execute the following commands
		sel disk 0
		sel vol 5
		remove letter=Z
			
		
		
	
