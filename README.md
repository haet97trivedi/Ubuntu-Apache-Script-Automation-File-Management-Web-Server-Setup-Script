<!DOCTYPE html>
<html>
<head>
</head>
<body>
 <h1>Ubuntu-Apache-Script-Automation-File-Management-Web-Server-Setup</h1>
 <p>This repository contains resources and detailed steps to automate file management, setup Apache web server on Ubuntu, and enable SSH for remote access.</p>

 <h2>Table of Contents</h2>
 <ol>
     <li><a href="#task1">Script Automation and File Management</a></li>
     <li><a href="#task2">Apache Web Server Setup on Ubuntu</a></li>
     <li><a href="#task3">Enabling SSH on Ubuntu</a></li>
 </ol>

 <h2 id="task1">Script Automation and File Management</h2>
 <p>Scripts for managing files in directories. They take command line arguments, separate files into respective directories, create summary files, and perform clean up operations.</p>
 <ul>
     <li><strong>cleanup.sh</strong>: Cleans up created directories and files.</li>
     <li><strong>process_files.sh</strong>: Unzips files, creates directories for each file type, lists all the files in each directory, and creates a summary.txt file for each directory.</li>
 </ul>

 <h2 id="task2">Apache Web Server Setup on Ubuntu</h2>
 <p>Steps to install and configure Apache2 server on Ubuntu.</p>
 <ul>
     <li>Update the system repositories.</li>
     <li>Install Apache2 using the apt command.</li>
     <li>Validate the Apache Installation.</li>
     <li>Configure the Firewall settings.</li>
     <li>Verify that the Apache Service is running.</li>
     <li>Verify that the Apache2 is running properly and listens on your IP Address.</li>
     <li>Set up Virtual Hosts in Apache.</li>
 </ul>

 <h2 id="task3">Enabling SSH on Ubuntu</h2>
 <p>Steps to install and enable SSH on Ubuntu for remote access.</p>
 <ul>
     <li>Install the openssh-server package.</li>
     <li>After the installation, the SSH service will start automatically. Verify it by checking the SSH server status.</li>
     <li>If the firewall is enabled on your system, make sure to open the SSH port.</li>
     <li>Connect to SSH over LAN.</li>
 </ul>

 <h2>Requirements</h2>
 <p>The required libraries and packages are:</p>
 <ul>
     <li>Python</li>
     <li>sqlite3 module in Python</li>
     <li>Ubuntu</li>
     <li>Apache2</li>
     <li>OpenSSH server</li>
 </ul>

 <h2>Conclusion</h2>
 <p>By following the above steps, you can automate file management, setup Apache web server, and enable SSH on Ubuntu. This setup is efficient for managing files, hosting websites, and secure remote access.</p>
</body>
</html>
