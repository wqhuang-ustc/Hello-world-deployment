FROM kylinhuang/hello_world_base:latest
LABEL MAINTAINER="Weiqing Huang <wqhuang.ustc@gmail.com>"
RUN git clone https://github.com/wqhuang-ustc/Hello-world-frontend.git;
WORKDIR /Hello-world-frontend
RUN yarn install; yarn build
#remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf
#copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/
# append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80
CMD service nginx start