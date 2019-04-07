ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy MQTT-bridge package.json
COPY package.json /opt/

# Set workdir
WORKDIR /opt

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install requirements for add-on
RUN apk add --no-cache jq \
    && apk add --no-cache \
        git=2.20.1-r0 \
        nodejs=10.14.2-r0 \
        npm=10.14.2-r0 \
        openssh-client=7.9_p1-r4 \
        paxctl=0.9-r0 \
        python2=2.7.15-r3 \
    \
    && paxctl -cm "$(command -v node)" \
    \
    && npm install \
        --no-optional \
        --only=production \
    \
    && npm cache clear --force

# Copy data for add-on
COPY . /opt
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
