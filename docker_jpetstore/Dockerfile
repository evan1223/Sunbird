FROM tomcat:9.0-jdk11

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME

COPY jpetstore.war $CATALINA_HOME/webapps/

# Create directories for Log4j2 setup
RUN mkdir -p $CATALINA_HOME/log4j2/lib && mkdir -p $CATALINA_HOME/log4j2/conf

# Copy the Log4j2 configuration file into the log4j2/conf directory
COPY log4j2-tomcat.xml $CATALINA_HOME/log4j2/conf/

# Copy the Log4j2 jar file into the log4j2/lib directory
COPY lib/*.jar $CATALINA_HOME/log4j2/lib/

COPY setenv.sh $CATALINA_HOME/bin/

RUN chmod +x $CATALINA_HOME/bin/setenv.sh

#Add AccessLogValve into server.xml
RUN sed -i '/<\/Host>/i \
<Valve className="org.apache.catalina.valves.AccessLogValve" \
directory="/proc/self/fd" \
prefix="1" \
suffix="" \
rotatable="false" \
pattern="%h %l %u %t &quot;%r&quot; %s %b" />' /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]



