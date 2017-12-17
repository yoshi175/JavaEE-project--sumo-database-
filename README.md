# JavaEE project (sumo database)
Follow the steps below to install the project on your computer.

1. Download the project from github.

2. Download and install the latest version of Eclipse Java EE (Enterprise Edition).

3. Download and install Apache Tomcat 8 (https://tomcat.apache.org/download-80.cgi).

4. In Eclipse, create a new server.
	4.1 In Eclipse choose File > New > Other.. > Server.
	4.2 Select Tomcat version 8 or 8.5.

5. Import the project you just downloaded from github into Eclipse.
	5.1 In Eclipse choose File > Import... > Existing Project into Workspace.
	5.2 Select the root directory by locate the "sumodb" folder (JavaEE-project--sumo-database-\sumodb) where you saved it on your computer and click finish.

6. Download the three zip files below, unpack all of them and copy the jar files and paste them into the project folder: JavaEE-project--sumo-database-\sumodb\WebContent\WEB-INF\lib
	6.1 javax.servlet.jsp.jstl-1.2.1.jar, (http://www.java2s.com/Code/Jar/j/Downloadjavaxservletjspjstl121jar.htm)
	6.2 javax.servlet.jsp.jstl-api-1.2.1.jar (http://www.java2s.com/Code/Jar/j/Downloadjavaxservletjspjstlapi121jar.htm)
	6.3 mysql-connector-java-5.1.45 (https://dev.mysql.com/downloads/connector/j/)

7. Download and install MySQL Installer (the MySQL Intaller makes sure that you all the required files and programes for it to work properly).
	7.1 MySQL Installer (https://dev.mysql.com/downloads/windows/installer/5.7.html)
	7.2 Follow the installation steps to set up the database.

8. When you have finished the installation, open up MySQL Workbench and login. Once you have logged in to MySQL Workbench you need to import the sumo database.
	8.1 In MySQL Workbench choose Server > Data Import.
	8.2 Select the radio button "Import from Self-Contained File" and locate the "SumoDatabase.sql" file from the project folder (JavaEE-project--sumo-database-\MySQL Database - sumo\SumoDatabase.sql).
	8.3 On the "Default Target Schema" click the "New..." button and create a new schema called "sumo".
	8.4 Once it all set, click the "Start Import" button.

9. Now you have to make a new user in MySQL Workbench.
	9.1 In MySQL Workbench choose Server > Users and Privileges.
	9.2 Add a new user by clicking the "Add Account" button. And set the login name to "sumo2" and the password to "sumo2", then click the "Apply" button.

10. The final step is to start the project from Eclipse.
	10.1 In Eclipse right click on the project (sumodb) and choose Run As > Run On Server
	10.2 Select the server you recently created and click next.
	10.3 Add the project to the server by highlight it on the left side of the window and click the "Add" button and then click finish.
	10.4 Now it should be up and running. Go to your browser and type "localhost:8080/sumodb" and click enter. Have fun!
	
