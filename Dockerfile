FROM tomcat:latest

LABEL maintainer="Mohan Nithish"

ADD ./var/jenkins_home/workspace/database1/target/LoginWebApp-1.war /usr/local/tomcat/webapps/



EXPOSE 8080

CMD ["catalina.sh", "run"]
