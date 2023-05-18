FROM node:alpine AS BUILD_IMAGE
RUN apk add --no-cache git
WORKDIR /application
RUN git clone https://github.com/axen9223/regexlearn.com.git
WORKDIR /application/regexlearn.com
RUN yarn install --frozen-lockfile
RUN yarn build

FROM node:alpine
WORKDIR /application/regexlearn.com
COPY --from=BUILD_IMAGE /application/regexlearn.com .
EXPOSE 3000
CMD yarn start
