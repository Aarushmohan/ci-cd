FROM tomcat:latest

LABEL maintainer="Mohan Nithish"

COPY LoginWebApp-1.war /var/jenkins_home/workspace/database1/target/LoginWebApp-1.war  


EXPOSE 8080

CMD ["catalina.sh", "run"]
