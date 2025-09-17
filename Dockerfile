FROM n8nio/n8n:latest

USER root

COPY editor-ui.tar.gz /tmp/

RUN mkdir -p /tmp/check && \
    tar -xzf /tmp/editor-ui.tar.gz -C /tmp/check && \
    rm -rf /usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/dist/* && \
    cp -r /tmp/check/dist/* /usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/dist/ && \
    rm -rf /tmp/check /tmp/editor-ui.tar.gz && \
    chown -R node:node /usr/local/lib/node_modules/n8n/node_modules/n8n-editor-ui/dist/

USER node
