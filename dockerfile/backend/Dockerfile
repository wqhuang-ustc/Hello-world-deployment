FROM kylinhuang/hello_world_base:latest
LABEL MAINTAINER="Weiqing Huang <wqhuang.ustc@gmail.com>"
RUN git clone https://github.com/wqhuang-ustc/Hello-world-backend.git;
WORKDIR /Hello-world-backend
RUN yarn install
WORKDIR /Hello-world-backend/src/server
CMD node index.js