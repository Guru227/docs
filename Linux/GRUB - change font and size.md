# CHANGING GRUB FONT AND FONT SIZE (Yet to work)


## CREATE FONT
Create a font type recognised by GRUB. Here I create a font with font-face `DejaVuSansMono` and font-size `36` from Ubuntu's font library.

	sudo grub-mkfont -s 36 -o /boot/grub/DejaVuSansMono.pf2 /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf
	
> to be tested with the flag `–size=36` instead of `-s 36`;

## SET FONT (x)
A font is chosen and set for update into the config file

	GRUB_FONT=/boot/grub/DejaVuSansMono.pf2 
> not sure if this runs; <br>
> ‘grub-install label-font’ was also explored in vain - is a legacy command or a command which never existed

## UPDATE GRUB (x)
The config file is updated to reflect the changes made. 

	sudo grub-mkconfig -o /boot/grub/grub.cfg

> Is used to create config file from defaults – thats what terminal outputs <br>
> In boot/grub/grub.cfg, font = ‘usr/share/grub/unicode.pf2’


## Legend:
(x) 	<-- Does not work / throws error