FROM tomcat:9.0.53-jre8
RUN mkdir /usr/local/tomcat/webapps/hw2
COPY ./survey.war /usr/local/tomcat/webapps