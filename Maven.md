# Maven 

## Installation and Configuration
1. Install maven binaries from Apache Maven and extract them into `C:\Program Files`
1. Set Environment Variables
    - M2_HOME=C:\Program Files\Apache Software Foundation\apache-maven-3.3.1
    - M2=%M2_HOME%\bin 
    - MAVEN_OPTS=-Xms256m -Xmx512m
1. Add Maven binary to System Path by appending %M2% to the end of the variable
1. Ensure variables are set correctly using `mvn --version`

## Project Object Model (POM)

POM is the fundamental unit of work in Maven. It is an XML file that resides in the base diresctory of the project as pom.xml. 

The POM cotains information about the project and various configuration details used by Maven to build the project.

POM also contains the goals and plugins. While executing a task or a goal, Maven looks for the POM in the current directory. It reads the POM, gets the needed configuration information, and the executres the goal. Some of the configuration that can be specified in the POM are:
    - project dependencies
    - plugins
    - goals
    - build profiles
    - project version
    - developers
    - mailing list

Before creating a POM, we should first decide the project group (groupId), it name(strifactId), and its version as these attributes help in uniquely identifying the project in repository.

### POM example

```
<project xmlns = "http://maven.apache.org/POM/4.0.0"
   xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation = "http://maven.apache.org/POM/4.0.0
   http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>

   <groupId>com.companyname.project-group</groupId>
   <artifactId>project</artifactId>
   <version>1.0</version>
</project>
```
### Important Notes

1. It should be noted that there should be a single POM file for each project.

1. All POM files require the project element and three mandatory fields: groupId, artifactId, version

1. Project notation in repository is `groupId:artifactId:version`

1. Minimal requirements for a POM are:
    1. **Project Root** - This is the project root tag. You need to specify the basic schema setting such as apache schema and w3.org specification
    1. **Model version** - model version should be 4.0.0
    1. **groupId** - This is an Id of project's group. THis is generally unique amongst an organisation or a project. For example, a banking group `com.company.bank` has all bank related projects.
    1. **artifactId** - This is an Id of the project. This is generally the name of the project. For example, consumer-banking. Along with the groupId, the artifactId defines the artifact's location within the repository.
    1. **Version** - THis is the version of the project. Along with the groupId, it is used within an artifact's repository to seperate version from each other. For example:
        - com.company.back:consumer-banking:1.0
        - com.company.back:consumer-banking:1.1

### Super POM

The super POM is Maven's default POM. All POMs inherit from a parent or default (despite explicitly defined or not). THis base POM is known as the Super POM and contains values inherited by default.

Maven uses the effective POM (configuration from super POM plus project configuration) to execute the relevant goal. It helps developers to speecify minimum configuration detail in his/her `pom.xml`.

An easy way to look at the default configurations of the super POM is by running the command `mvn help:effective-pom`.

Create a pom.xml in any directory on your computer using the content of the above mentioned example POM. Then run the above mentioned help command.

Maven will create and then show the effective POM. In the effective POM, you can see the default project source folders structure, output directory, plug-ins required, repositories, and reporting directory which Maveen will use while executing the desired goals.

## Source

1. [Tutorials Point](https://www.tutorialspoint.com/maven/maven_environment_setup.htm)