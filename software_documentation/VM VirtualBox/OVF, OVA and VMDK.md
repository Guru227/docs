# OVF, OVA and VMDK - different file formats for virtualization

Virtual appliances may or may-not have full blown Operating systems supporting the applications, but the key thing is that they rarte able to run directly on a hypervisor. 'GitHub eneterprise' allows a business to deploy a copy of the GitHub plpatform within their network, which is distributed as a virtual appliance.

## File formats for Virtual Machines

1. Open Virtualization Format (OVF) <br>
> The OVF specification provides a means of describing the properties of a virtual system. It is XML based and has generous allowances for extensibility. Most commonly, an OVF file is used to describe a single virtual machine or virtual appliance. It can contain information about the format of the virtual disk image as well as a description of the virtual harware that should be emulated to run the OS or application contained on such a disk image.

1. Open Virtual Appliance (OVA) <br>
> An OVA is an OVF packaged file packaged together with all of its supporting files (disk images, etc.). The requirements for a valid OVA package can be read in the OVF specification.

## Formats for disk images
1. VDI - VirtualBox's default disk image.
1. VMDK - one of the m,ost common formats


## Glossary

1. Virtual Appliance - (a subset of software appliances) is a pre-configured virtual machine image ready to run on a hypervisor. Installation of a software appliance on a virtual machine and packaging that into an image creates a virtual appliance.

1. Software appliance - is as software application combines with Just enough Operating System (JeOS) to run optimally on industry-standard hardware (typically a sevrer) or in a virtual machine. It is a software distribution or firmware that implements a computer appliance.

1. Computer Appliance - is a computer with software or firmware that is specifically designed to provide a specific computing resource. The h/w and s/w are delivered as an integrated product and may even be pre-configured before delivery. Unlike general purpose computers, appliances are generally not designed to allow the customers to change the software and the underlying OS, or to flexibly reconfigure the hardware.

1. Hypervisor (Virtual Machine Monitor / VMM) - is computer software, firmware or hardare that creates and runs virtual machines. The term 'hypervisor' is a variant of 'supervisor', a traditional term for the kernel of an OS: the hypervisor is the supervisor of the supervisors. The hypervisor presents the guest operating systems with a virtual operating platform and manages the execution of the guest operating systems.

## Source:
1. [OVF? OVA? VMDK? – File Formats and Tools for Virtualization](https://spin.atomicobject.com/2013/06/03/ovf-virtual-machine/)