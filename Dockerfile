FROM tomcat:8-jre8
COPY ./web/target/*.war /usr/local/tomcat/webapps/