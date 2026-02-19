#!/bin/bash

echo "Building project..."
mvn clean package

echo "Copying WAR to Tomcat webapps..."

cp -f target/userapp.war /c/Users/User/Downloads/apache-tomcat-9.0.107/apache-tomcat-9.0.107/webapps/

echo "WAR copied successfully."
echo "Now restart Tomcat."
