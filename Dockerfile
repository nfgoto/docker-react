# can tag as a phase with "as"
FROM node:alpine as builder
WORKDIR /app
COPY ./package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# second phase
FROM nginx
EXPOSE 80
# copy from a different phase
COPY --from=builder /app/build /usr/share/nginx/html