#!/bin/sh

npm install -D
npm uninstall bloxy
npm install https://github.com/LengoLabs/bloxy.git
cd node_modules/bloxy
npm run build
cd ../..
npm install got@11.8.2

npx prisma migrate dev --schema ./src/database/schema.prisma --name init