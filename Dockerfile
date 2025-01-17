ARG NODE_VERSION="13.2"

FROM node:$NODE_VERSION-buster-slim

LABEL name="Docker Expo dev environment"
LABEL repository="https://github.com/nsollazzo/dev-expo"
LABEL homepage="https://github.com/nsollazzo/dev-expo"

ARG EXPO_VERSION="latest"

EXPOSE 19000
EXPOSE 19001
EXPOSE 19002

#used by react native builder to set the ip address, other wise 
#will use the ip address of the docker container.
ENV REACT_NATIVE_PACKAGER_HOSTNAME="10.0.0.2"

RUN apt update && apt install -y \
    git \
    procps

RUN yarn global add expo-cli@$EXPO_VERSION \
	&& yarn cache clean

COPY entrypoint.sh LICENSE.md README.md /

ENTRYPOINT ["/entrypoint.sh"]
