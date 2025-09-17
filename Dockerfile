FROM n8nio/n8n:latest

USER root

COPY editor-ui.tar.gz /tmp/

RUN mkdir -p /tmp/check && \
    tar -xzf /tmp/editor-ui.tar.gz -C /tmp/check && \
    rm -rf /usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/dist/* && \
    cp -r /tmp/check/dist/* /usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/dist/ && \
    rm -rf /tmp/check /tmp/editor-ui.tar.gz && \
    chown -R node:node /usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/dist/
	
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 py3-pip curl ffmpeg wget
RUN pip3 install --no-cache --upgrade  --break-system-packages pip setuptools speedtest-cli 

USER node
