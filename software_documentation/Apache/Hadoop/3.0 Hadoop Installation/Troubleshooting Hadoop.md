# Troubleshooting Hadoop

There are many aspects where Hadoop will run into problems. The following aspects are the common areas where Hadoop faces configuration problems. The only way to know for sure and fix your specific problem is by looking at the logs, which can be found in `/hadoop/logs/`.

1. **Network** <br>
	- Make sure all nodes are connected on a local network, with distinct names. <br>
	- Each machine should have a name configured on /etc/hostname <br>
	- Make sure the networks can be accessed by each other (given all permissions) <br>
		+ `ALL:ALL` is present in `/etc/hosts.allow`. (I'm not sure if this step is required.) <br>
	- Ensure each machine has a static IP address and is configured in etc/hosts

	
1. **RSA KEY (SSH configuration)** <br>
	- pdsh is installed
	- ssh is installed
	- rcmd_type is set as ssh
	- Master's key is shared among slaves
	- permissions of key are set to readable and executable only (not writable)

1. Ensure `hdfs-site.xml` is configured seperately for each node.<br>
	- Datanode should only have an entry for datanode in hdfs-site.xml (and corresponding directory)
	- Namenode was run with an entry for datanode (and correspomding directory) as well, but I think it can be deleted.
> **NOTE:** The entries of the HDFS data locations on the local filesystem in the .xml file should not begin their paths with "file://".
	
1. Check the other configuration files
	- core-site.xml
	- mapred-site.xml
	- yarn-site.xml
> **Information:** Default configurations for block size and stoarge size were used!!!

1. Ensure the directory owner of the HDFS file locations is the 'user' and not 'root'
	- chmod 755 for all underlying directories

1. Remove all tmp files. Sometimes they cause problems
	- /tmp/hadoop-*

1. Ensure `hadoop/etc/hadoop/workers` is correctly configured
>	Should have the list of workers (the computer's names that are configured as datanodes)

1. Finally format namenode
> `hdfs namenode -format`

1. Finally, run HDFS (and start-yarn.sh, if configured as the resource manager)
>	
	```
	start-dfs.sh
	start-yarn.sh
	```

1. Check running JVM processes using `jps` <br>
> Ensure that NameNode instance and resourceManager instance are running on the machine configured as the nameNode. <br>
> <br>
> Ensure the DataNode and nodeManager instances are running on each machine configured as the dataNode. <br>

## Sources
1. [The idea this error had to do something with permissions](https://community.cloudera.com/t5/Support-Questions/Failed-to-start-namenode-Directory-is-in-an-inconsistent/td-p/32548)

## Further Reading
1. [Adding nodes to a HDFS system](https://www.tutorialspoint.com/hadoop/hadoop_multi_node_cluster.htm)