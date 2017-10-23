FROM nginx:alpine

RUN set -ex ;\
  apk add --no-cache --purge -U \
    nodejs \
    git \
    ;\
  git clone --depth=1 https://github.com/keyfender/keyfender-ui ;\
  cd keyfender-ui ;\
  npm install ;\
  npm run build ;\
  cp -a index.html dist /usr/share/nginx/html/ ;\
  cd .. ;\
  rm -rf /root/.npm ;\
  rm -rf keyfender-ui ;\
  apk del \
    git \
    nodejs \
    ;\  
  rm -rf /var/cache/apk/*
