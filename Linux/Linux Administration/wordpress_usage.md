# Using wordpress to create a website
--- 28 May 2021 ---
--- Wordpress version 5.7.2 ---

## Take a backup

It's helpful to a backup of the `wordpress` directory before you begin using 
wordpress. You can use it to reset your wordpress server without having to 
resinstall wordpress in many cases. Move into the directory containing the `wordpress` and run the following command to generate a .tar.gz file.

`sudo tar -czvf wp.bak.tar.gz wordpress`

## Install Themes and downloading starter templates

Ensure that the wordpress server is connected to the server and is up-to date.
You can check for the sites health by clicking on the `sites-health` link under 
the `tools` option in the vertical menu. If the site is not healthy, enable the debug flags as described in the following sections and troubleshoot the problem.

### Install a theme

Under `Appearance` click on `Themes`. In the opened window, click on `Add New`. 
From here, select a theme. Some good, free themes are Astra, Generate press, and 
OceanWP. Install the theme and activate one of them. Let's use Astra for this 
example.

After ensuring that you have a backup, you can go to the `pages` link in the 
vertical menu and delete all the default webpages there are. You can build your 
webpages after this step.



### Downloading a starter template and creating you webpage with it

Upon activating this, you should be able to see some more options under the 
`Appearance` option. Now, choose `Starter Templates` and install a template 
that will fit your purpose. 

You might be asked to select a `page builder` from four options. Select 
`Elementor`. This is the most functional while being the most intuitive among
the four options.

Then, go back to the `pages` option in the vertical menu and select the webpage 
you'd like to begin editing. Then, click on `Edit with Elementor`. Then edit the webpage the way you want it.

Make sure to save them as `Templates` or `Drafts` regularly to ensure you don't 
lose the data. Once you're done, `publish` this webpage (green button at the 
bottom of the vertical menu). 

If this is not your currently published page, first save the page and then go to 
the wordpress dashboard. Then, click on the `customize your site` option under 
the vertical menu, select the `homepage settings` and select the `static page` 
option. Then, choose your webpage that you would like to set as your homepage.



## Enabling debug flags in wordpress

Open to `wordpress/wp-config.php`. In the file, change the directive from
`define( 'WP_DEBUG', false)` to `define ('WP_DEBUG', true)`. This directive will 
enable the logs to be shown on the webpage just below the horizontal menu.

Add another directive `define ('WP_DEBUG_LOG', true)`. This directive will record
the logs into `wordpress/wp-content/debug.log`. 

**NOTE: ** The debug flags are expected to be switched off for the correct 
working of some plugins and themes.



# Sources

1. (Installing Themes, downloading starter templates, and editing your webpage) 
https://www.youtube.com/watch?v=vEKigoWjtSg&t=2s 

1. (Debugging wordpress) https://wordpress.org/support/article/debugging-in-wordpress/