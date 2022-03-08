#####  !!!!!!!!!!  make sure  you change the ACR-name variable in startup.sh to the ACR that you are pushing to !!!!!!!
#FROM openjdk:11-jre  
FROM --platform=linux/amd64 openjdk:11-jre  
##  --platform=linux/amd64 not necessary unless building from Mac with Apple silicon 
RUN mkdir -p /opt/shinyproxy/
RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.6.0.jar -O /opt/shinyproxy/shinyproxy.jar
COPY startup.sh /opt/shinyproxy/
 
WORKDIR /opt/shinyproxy/
CMD ["/opt/shinyproxy/startup.sh"]
