FROM golang:1.16.7-alpine AS staging
WORKDIR /usr/src/app
COPY . .

FROM golang:1.16.7-alpine AS production
WORKDIR /home/root
COPY --from=staging /usr/src/app /home/root
EXPOSE 5000
CMD ["go", "run", "main.go"]
