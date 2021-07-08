FROM node:12-alpine AS build
WORKDIR /opt/app
COPY package.json package-lock.json tsconfig.json /opt/app/
COPY src/ /opt/app/src/
RUN npm install
RUN npm run build

RUN echo 11111
RUN sleep 1
RUN echo 22222
RUN sleep 1
RUN echo 33333
RUN sleep 1
RUN echo 44444
RUN sleep 1
RUN echo 55555
RUN sleep 1
RUN echo 66666
RUN sleep 1
RUN echo 77777
RUN sleep 1
RUN echo 88888
RUN sleep 1
RUN echo 99999
RUN sleep 1
RUN echo 00000
RUN sleep 1

RUN echo -n 11111
RUN sleep 1
RUN echo -n 22222
RUN sleep 1
RUN echo -n 33333
RUN sleep 1
RUN echo -n 44444
RUN sleep 1
RUN echo -n 55555
RUN sleep 1
RUN echo -n 66666
RUN sleep 1
RUN echo -n 77777
RUN sleep 1
RUN echo -n 88888
RUN sleep 1
RUN echo -n 99999
RUN sleep 1
RUN echo -n 00000
RUN sleep 1

FROM node:12-alpine
ENV DOCKER true
ENV PORT 8080
EXPOSE 8080
WORKDIR /opt/app
COPY package.json package-lock.json /opt/app/
RUN npm install --production
COPY --from=build /opt/app/out/ /opt/app/out/
CMD [ "node", "out" ]
