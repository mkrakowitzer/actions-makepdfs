FROM node:19

RUN apt-get update && \
    apt-get -y install xvfb gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 \
      libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 \
      libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
      libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
      libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget curl && \
    rm -rf /var/lib/apt/lists/*

RUN npm install puppeteer@5.2.1 markdown-it mustache markdown-it-named-headers cheerio markdown-it-highlightjs markdown-it-table-of-contents markdown-it-anchor
COPY makepdfs.js /
COPY package.json /
COPY template/ template/
COPY styles/ styles/

RUN     fc-cache -fv && \
        chmod +x /makepdfs.js && \
        mkdir /pdf && \
        chmod 777 /pdf && \
        ln -s /makepdfs.js /usr/local/bin/makepdfs
CMD [ "makepdfs" ]
