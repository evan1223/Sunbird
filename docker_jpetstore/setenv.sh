/bin/sh

# Ensure the script is executable
chmod +x /usr/local/tomcat/bin/setenv.sh

# Include Log4j2 libraries and configuration in the classpath
export CLASSPATH=$CATALINA_HOME/log4j2/lib/*:$CATALINA_HOME/log4j2/conf

# Ensure smooth log handling during container shutdown
# Enable shutdown hook might conflict with the lifecycle management of the environments(container or server)
export JAVA_OPTS="$JAVA_OPTS -Dlog4j2.shutdownHookEnabled=false"

