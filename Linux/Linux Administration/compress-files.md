# Compressing and decompressing files in ubuntu
--- 28 May 2021 ---

## .tar.gz

### Compressing into .tar.gz files

To compress one file or directory, use the following command

`tar -czvf name-of-archive.tar.gz /path/to/directory-or-file`

You can compress a bunch of files or directories into an archive by executing:

`tar -czvf name-of-archive.tar.gz /path/to/directory-or-file1 /path/to/directory-or-file1 ...`

### `exclude` switch

You can use `tar ... --exclude=<file_or_directory_path1> --exclude==<file_or_directory_path2>` 
to exclude files or directories from your archive. You can use globbing patterns 
in the exclude flag. For example, `--exclude=*.mp4`.

### Extracting .tar.gz files

`tar -xzvf archive.tar.bz`

To specify an output directory, use the `-C` flag.

`tar -xzvf archive.tar.bz -C /tmp`

***NOTE: *** You can specify the compression and extraction of bzip2 files 
instead of .tar.bz files by replacing `*zvf` with `*jvf`.

## zip

### install zip and unzip utilities
`sudo apt install zip unzip`

### Unzipping a file
`unzip <path-to-file>.zip`

### Unzipping multiple files in the same directory
`unzip "*.zip"`

### Checking for errors in compressed data
`unzip -t <path-to-file>.zip`

### Excluding some files from extraction
`unzip <path-to-file>.zip -x <file-not-to-be-extracted>`

### Listing contents of a Zip File
`unzip -l <path-to-file>.zip`

### Extract a ZIP file to a different directory
`unzip <path-to-file>.zip -d <path-to-directory>`




# Sources
1. (compressing into tar.gz) https://www.howtogeek.com/248780/how-to-compress-and-extract-files-using-the-tar-command-on-linux/

1. (zip files) https://phoenixnap.com/kb/how-to-unzip-file-linux-ubuntu