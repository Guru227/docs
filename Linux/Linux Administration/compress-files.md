# Compressing and decompressing files in ubuntu
--- 28 May 2021 ---
## Compressing into .tar.gz files

To compress one file or directory, use the following command

`tar -czvf name-of-archive.tar.gz /path/to/directory-or-file`

You can compress a bunch of files or directories into an archive by executing:

`tar -czvf name-of-archive.tar.gz /path/to/directory-or-file1 /path/to/directory-or-file1 ...`

## exclude switch

You can use `tar ... --exclude=<file_or_directory_path1> --exclude==<file_or_directory_path2>` 
to exclude files or directories from your archive. You can use globbing patterns 
in the exclude flag. For example, `--exclude=*.mp4`.

## Extracting .tar.gz files

`tar -xzvf archive.tar.bz`

To specify an output directory, use the `-C` flag.

`tar -xzvf archive.tar.bz -C /tmp`

***NOTE: *** You can specify the compression and extraction of bzip2 files 
instead of .tar.bz files by replacing `*zvf` with `*jvf`.


# Sources
1. (compressing into tar.gz) https://www.howtogeek.com/248780/how-to-compress-and-extract-files-using-the-tar-command-on-linux/